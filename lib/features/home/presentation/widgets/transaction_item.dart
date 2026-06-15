import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    this.onDelete,
    this.onEdit,
  });
  final TransactionModel transaction;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == 'income' || transaction.type == 'دخل';
    final Color itemColor = isIncome ? Colors.green : Colors.red;
    final Color itemBgColor = isIncome
        ? Colors.green.withAlpha(20)
        : Colors.red.withAlpha(20);
    final IconData itemIcon = isIncome
        ? Icons.arrow_downward
        : Icons.arrow_upward;
    final bool showActions = onDelete != null || onEdit != null;

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
        border: Border(right: BorderSide(color: itemColor, width: 5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: itemBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(itemIcon, color: itemColor, size: 20),
              ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
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
            ],

          ),
          Column(
            children: [
              Text(
                '${isIncome ? "+" : "-"}${NumberFormat('#,###').format(transaction.amount)} ل.س',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(color: itemColor),
              ),

              if (showActions) ...[
                const SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onPressed: () {
                        if (onEdit != null) onEdit!();
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                      onPressed: () {
                        showDeleteDialog(context);
                      },
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'تأكيد الحذف',
            style: TextTheme.of(context).bodyLarge?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'هل أنت متأكد من رغبتك في حذف هذه المعاملة نهائياً؟',
            style: TextTheme.of(context).bodyMedium?.copyWith(
              color: AppColors.textGray,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('إلغاء', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                if (onDelete != null) onDelete!();
              },
              child:  Text(
                'حذف',
               
            style: TextTheme.of(context).bodyLarge?.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
