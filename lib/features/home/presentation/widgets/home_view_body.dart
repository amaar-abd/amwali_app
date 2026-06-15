import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/home/presentation/widgets/expenses_income_chart.dart';
import 'package:amwali/features/home/presentation/widgets/financial_status_card.dart';
import 'package:amwali/features/home/presentation/widgets/transaction_items_list.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 3,
            ),
          );
        }
        if (state is FinanceDataLoaded) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
              const    SizedBox(height: 10),
                  FinancialStatusCard(
                    currentBalance: state.currentBalance,
                    totalIncome: state.totalIncome,
                    totalExpense: state.totalExpense,
                  ),
               const   SizedBox(height: 20),
                  ExpensesIncomeChart(
                    totalIncome: state.totalIncome,
                    totalExpenses: state.totalExpense,
                  ),
                const  SizedBox(height: 20),
                  TransactionItemsList(
                    title: 'المعاملات الاخيرة',
                    transactions: state.latestTransactions,
                  ),
                 const SizedBox(height: 10),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
