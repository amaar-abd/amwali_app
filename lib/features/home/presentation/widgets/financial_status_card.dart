import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinancialStatusCard extends StatelessWidget {
  const FinancialStatusCard({
    super.key,
    required this.currentBalance,
    required this.totalIncome,
    required this.totalExpense,
  });
  final double currentBalance;
  final double totalIncome;
  final double totalExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'إجمالي الرصيد الحالي',
              style: TextTheme.of(
                context,
              ).bodyMedium?.copyWith(color: AppColors.textDark, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '${NumberFormat('#,###').format(currentBalance)} ل.س',
              style: TextTheme.of(context).displayLarge?.copyWith(
                color: AppColors.primaryGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.textGray.withAlpha(20),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.trending_down, color: Colors.green),
                              const SizedBox(width: 8),
                              Text(
                                'الدخل الشهري',
                                style: TextTheme.of(context).bodyMedium
                                    ?.copyWith(color: AppColors.textDark),
                              ),
                            ],
                          ),
                          Text(
                            '${NumberFormat('#,###').format(totalIncome)} ل.س',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.textGray.withAlpha(20),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.trending_up, color: Colors.red),
                              const SizedBox(width: 8),
                              Text(
                                'الصرف الشهري',
                                style: TextTheme.of(context).bodyMedium
                                    ?.copyWith(color: AppColors.textDark),
                              ),
                            ],
                          ),
                          Text(
                            '${NumberFormat('#,###').format(totalExpense)} ل.س',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
