import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildProgressSection extends StatelessWidget {
  const BuildProgressSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.percentage,
    required this.progressValue,
    required this.color,
    required this.statusText,
    required this.statusIcon,
    this.isGradient = false,
  });
  final String title;
  final String subtitle;
  final String percentage;
  final double progressValue;
  final Color color;
  final String statusText;
  final IconData statusIcon;
  final bool isGradient;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(color: AppColors.textGray),
                ),
              ],
            ),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 14,
            child: isGradient
                ? Stack(
                    children: [
                      Container(color: Colors.grey.shade200),
                      FractionallySizedBox(
                        widthFactor: progressValue,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFBBF24), Color(0xFF1E40AF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              statusText,
              style: TextTheme.of(context).bodySmall?.copyWith(color: color),
            ),
            const SizedBox(width: 6),
            Icon(statusIcon, color: color, size: 16),
          ],
        ),
      ],
    );
  }
}
