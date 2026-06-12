import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.money),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'استلام الراتب الشهري',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(color: AppColors.textDark),
              ),
              const SizedBox(height: 5),
              Text(
                '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}',
                style: TextTheme.of(
                  context,
                ).bodySmall?.copyWith(color: AppColors.textGray),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                ' 420000 ',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(color: AppColors.textDark),
              ),
              const SizedBox(height: 5),
              Text(
                'مكتمل',
                style: TextTheme.of(
                  context,
                ).bodySmall?.copyWith(color: AppColors.textGray),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
