import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TransactionsCategoryItem extends StatelessWidget {
  const TransactionsCategoryItem({
    super.key,
    required this.title,
    this.icon,
    required this.isSelected,
    this.onTap,
  });
  final String title;
  final IconData? icon;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
     borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? AppColors.primaryGreen : Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(

            children: [
              
             if (icon != null) ...[
                Icon(icon, color: isSelected ? Colors.white : Colors.black),
                const SizedBox(width: 6),
              ],
              Text(
                title,
          
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
