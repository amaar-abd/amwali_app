import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/advisor/presentation/widgets/build_progress_section.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetAnalysisCard extends StatelessWidget {
  const BudgetAnalysisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 3,
            ),
          );
        } else if (state is FinanceDataLoaded) {
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
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.bar_chart_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),

                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'التوزيع الذكي للميزانية',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF1A365D),
                          ),
                        ),const SizedBox(height: 8),
                        Text(
                          'تحليل قاعدة 50/30/20 العالمية',
                          style: TextTheme.of(context).bodySmall?.copyWith(
                            color: AppColors.primaryGreen,
                            fontSize: 14,
                           
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                BuildProgressSection(
                  title: 'الاحتياجات الضرورية (50%)',
                  subtitle: 'الإيجار، الفواتير، الغذاء الأساسي',
                  percentage: state.needsPercentage,
                  progressValue: state.needsProgress,
                  color: state.needsProgress > 0.50
                      ? const Color(0xFFB91C1C)
                      : const Color(0xFF10B981),
                  statusText: state.needsProgress > 0.50
                      ? 'تنبيه: تجاوزت الميزانية المحددة للاحتياجات.'
                      : 'أداء ممتاز، أنت تحت الحد المسموح.',
                  statusIcon: state.needsProgress > 0.50
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline_rounded,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Divider(
                    color: Color.fromARGB(255, 181, 183, 186),
                    thickness: 1,
                  ),
                ),
                BuildProgressSection(
                  title: 'الرغبات والترفيه (30%)',
                  subtitle: 'السفر، التسوق، المطاعم',
                  percentage: state.wantsPercentage,
                  progressValue: state.wantsProgress,
                  color: state.wantsProgress > 0.30
                      ? const Color(0xFFB91C1C)
                      : const Color(0xFF10B981),
                  statusText: state.wantsProgress > 0.30
                      ? 'تنبيه: تجاوزت الميزانية المحددة للرغبات.'
                      : 'أداء ممتاز، أنت تحت الحد المسموح.',
                  statusIcon: state.wantsProgress > 0.30
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline_rounded,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Divider(
                    color: Color.fromARGB(255, 181, 183, 186),
                    thickness: 1,
                  ),
                ),
                BuildProgressSection(
                  title: 'الادخار والاستثمار (20%)',
                  subtitle: 'الأسهم، الصناديق، الطوارئ',
                  percentage: state.savingsPercentage,
                  progressValue: state.savingsProgress,
                  color: const Color(0xFF1E40AF),
                  statusText: state.savingsProgress >= 0.20
                      ? 'رائع! قمت بزيادة حصة الاستثمار هذا الشهر.'
                      : 'حاول زيادة ادخارك للوصول لنسبة 20%.',
                  statusIcon: state.savingsProgress >= 0.20
                      ? Icons.trending_up_rounded
                      : Icons.info_outline_rounded,
                  isGradient: true,
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
