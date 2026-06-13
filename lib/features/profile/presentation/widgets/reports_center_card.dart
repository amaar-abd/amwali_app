import 'package:amwali/features/profile/presentation/widgets/build_report_tile.dart';
import 'package:flutter/material.dart';

class ReportsCenterCard extends StatelessWidget {
  const ReportsCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'مركز التقارير',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          BuildReportTile(
            title: 'التقرير المالي الاسبوعي',
            icon: Icons.description_outlined,
          ),
          const SizedBox(height: 12),
          BuildReportTile(
            title: 'التقرير المالي الشهري',
            icon: Icons.description_outlined,
          ),
          const SizedBox(height: 12),
          BuildReportTile(
            title: 'التقرير المالي السنوي',
            icon: Icons.description_outlined,
          ),
          const SizedBox(height: 12),
          BuildReportTile(
            title: 'أداء المحفظة الاستثمارية',
            icon: Icons.trending_up_rounded,
          ),
          const SizedBox(height: 12),
          BuildReportTile(
            title: 'كشف حساب الضرائب',
            icon: Icons.account_balance_rounded,
          ),
        ],
      ),
    );
  }
}
