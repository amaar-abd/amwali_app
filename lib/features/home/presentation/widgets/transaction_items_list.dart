import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/home/presentation/widgets/add_transaction_bottom_sheet.dart';
import 'package:amwali/features/home/presentation/widgets/transaction_item.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionItemsList extends StatelessWidget {
  const TransactionItemsList({
    super.key,
    this.title,
    this.supTitle,
    required this.transactions,  this.isSearchPage= false ,
  });
  final String? title;
  final String? supTitle;
  final List<TransactionModel> transactions;
  final bool isSearchPage;

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
                title ?? '',
                style: TextTheme.of(context).bodyMedium?.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                supTitle ?? '',
                style: TextTheme.of(context).bodySmall?.copyWith(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          if (transactions.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  isSearchPage 
                      ? 'لا توجد نتائج مطابقة لبحثك!' 
                      : 'لا توجد معاملات مضافة بعد',
                  style: TextStyle(color: AppColors.textGray, fontSize: 20),
                ),
              ),
            )
          else
            ListView.builder(
              itemCount: transactions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TransactionItem(
                    transaction: transactions[index],
                    onDelete: () {
                      context.read<TransactionsCubit>().deleteTransaction(
                        transactions[index].id,
                      );
                    },
                    onEdit: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => AddTransactionBottomSheet(transaction: transactions[index],),
                      );
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
