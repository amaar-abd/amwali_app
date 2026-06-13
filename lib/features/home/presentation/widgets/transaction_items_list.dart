import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/home/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionItemsList extends StatelessWidget {
  const TransactionItemsList({super.key,  this.title,  this.supTitle});
  final String? title;
  final String? supTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title??'',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                supTitle??'',
                style: TextTheme.of(context).bodySmall?.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TransactionItem(),
              );
            },
          ),
        ],
      ),
    );
  }
}
