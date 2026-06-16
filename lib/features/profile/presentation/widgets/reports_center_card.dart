import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:amwali/core/services/pdf_report_service.dart';
import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/profile/presentation/widgets/build_report_tile.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

class ReportsCenterCard extends StatelessWidget {
  const ReportsCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_rounded,
                color: AppColors.primaryGreen,
                size: 28,
              ),
              const SizedBox(width: 10),
              Text(
                'التقارير الماليّة والتحليلات',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: const Color(0xFF1A365D),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'اختر التقرير الذي ترغب في تصديره كملف PDF.',
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextTheme.of(
              context,
            ).bodyMedium?.copyWith(fontSize: 14, color: AppColors.primaryGreen),
          ),
          const SizedBox(height: 24),

          BlocBuilder<TransactionsCubit, TransactionsState>(
            builder: (context, state) {
              List<TransactionModel> allTransactions = [];
              if (state is FinanceDataLoaded) {
                allTransactions = state.allTransactions;
              }
              return ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  BuildReportTile(
                    title: 'التقرير المالي الأسبوعي',
                    subtitle: 'ملخص المصاريف والدخل لآخر 7 أيام',
                    icon: Icons.calendar_view_week_rounded,
                    iconColor: Colors.blue.shade600,
                    onTap: () {
                      final weeklyData = allTransactions.where((tx) {
                        return now.difference(tx.date).inDays <= 7;
                      }).toList();

                      _openReportPreview(
                        context,
                        weeklyData,
                        'التقرير المالي الأسبوعي',
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  BuildReportTile(
                    title: 'التقرير المالي الشهري',
                    subtitle: 'كشف تحليلي شامل لمعاملات الشهر الحالي',
                    icon: Icons.calendar_month_rounded,
                    iconColor: AppColors.primaryGreen,
                    onTap: () {
                      final monthlyData = allTransactions.where((tx) {
                        return tx.date.month == now.month &&
                            tx.date.year == now.year;
                      }).toList();
                      _openReportPreview(
                        context,
                        monthlyData,
                        'التقرير المالي الشهري',
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  BuildReportTile(
                    title: 'التقرير المالي السنوي',
                    subtitle: 'الأداء المالي السنوي والمقارنات الإجمالية',
                    icon: Icons.assessment_rounded,
                    iconColor: Colors.orange.shade700,
                    onTap: () {
                      final yearlyData = allTransactions.where((tx) {
                        return tx.date.year == now.year;
                      }).toList();
                      _openReportPreview(
                        context,
                        yearlyData,
                        'التقرير المالي السنوي',
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  BuildReportTile(
                    title: 'أداء المحفظة الاستثمارية',
                    subtitle: 'تحليل نمو الأصول ونسب التوزيع الذكي',
                    icon: Icons.pie_chart_rounded,
                    iconColor: Colors.purple.shade600,
                    onTap: () {
                      final portfolioData = allTransactions.where((tx) {
                        return tx.category == 'investment' ||
                            tx.category == 'savings' ||
                            tx.category == 'استثمار';
                      }).toList();
                      _openReportPreview(
                        context,
                        portfolioData,
                        'تقرير أداء المحفظة الاستثمارية',
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void _openReportPreview(
    BuildContext context,
    List<TransactionModel> transactions,
    String title,
  ) async {
    final pdfBytes = await PdfReportService.generateFinancialReport(
      transactions: transactions,
      reportTitle: title,
    );

    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(
                title,
                style: TextTheme.of(context).bodyLarge?.copyWith(
                  color: AppColors.backgroundLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColors.primaryGreen,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: Center(
              child: PdfPreview.builder(
                build: (format) => pdfBytes,
                allowPrinting: true,
                allowSharing: true,
                canDebug: false,
                canChangeOrientation: false,
                canChangePageFormat: false,
                pdfFileName: "${title.replaceAll(' ', '_')}.pdf",
                actionBarTheme: const PdfActionBarTheme(
                  backgroundColor: Color(0xFF10B981),
                  iconColor: Colors.white,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                pagesBuilder: (context, pages) {
                  return Container(
                    color: const Color(0xFFF8FAFC),
                    width: double.infinity,
                    height: double.infinity,
                    child: InteractiveViewer(
                      clipBehavior: Clip.none,
                      minScale: 1.0,
                      maxScale: 4.0,

                      panEnabled: true,
                      scaleEnabled: true,
                      boundaryMargin: const EdgeInsets.all(100),
                      child: SingleChildScrollView(
                     physics:    const BouncingScrollPhysics(),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 16),
                              for (final page in pages)
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(50),
                                        blurRadius: 12,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      image: page.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },

                loadingWidget: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryGreen,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
