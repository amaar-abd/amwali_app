import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildReportTile extends StatelessWidget {
  const BuildReportTile({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryGreen),
              const SizedBox(width: 10),
              Text(title, style: TextTheme.of(context).bodyMedium),
            ],
          ),
          Icon(
            Icons.picture_as_pdf_outlined,
            color: Colors.grey.shade600,
            size: 20,
          ),
        ],
      ),
    );
  }
}
