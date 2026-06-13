import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/advisor/presentation/widgets/build_progress_section.dart';
import 'package:flutter/material.dart';

class BudgetAnalysisCard extends StatelessWidget {
  const BudgetAnalysisCard({super.key});

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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'تحليل قاعدة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF1A365D),
                    ),
                  ),
                  Text(
                    '50/30/20',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF1A365D),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
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
            ],
          ),

          const SizedBox(height: 28),

          BuildProgressSection(
            title: 'الاحتياجات الضرورية (50%)',
            subtitle: 'الإيجار، الفواتير، الغذاء الأساسي',
            percentage: '42%',
            progressValue: 0.42,
            color: const Color(0xFF10B981),
            statusText: 'أداء ممتاز، أنت تحت الحد المسموح.',
            statusIcon: Icons.check_circle_outline_rounded,
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
            percentage: '36%',
            progressValue: 1.0, 
            color: const Color(0xFFB91C1C), 
            statusText: 'تنبيه: تجاوزت الميزانية المحددة بنسبة 6%.',
            statusIcon: Icons.warning_amber_rounded,
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
            percentage: '22%',
            progressValue: 0.75, 
            color: const Color(0xFF1E40AF), 
            statusText: 'رائع! قمت بزيادة حصة الاستثمار هذا الشهر.',
            statusIcon: Icons.trending_up_rounded,
            isGradient: true, 
          ),
        ],
      ),
    );
  }
}
