import 'package:amwali/features/home/presentation/widgets/expenses_income_chart.dart';
import 'package:amwali/features/home/presentation/widgets/financial_status_card.dart';
import 'package:amwali/features/home/presentation/widgets/transaction_items_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            SizedBox(height: 10),
            FinancialStatusCard(),
            SizedBox(height: 20),
            ExpensesIncomeChart(),
            SizedBox(height: 20),
            TransactionItemsList(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
