import 'package:amwali/core/local_database/models/transaction_model.dart';

sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class FinanceDataLoaded extends TransactionsState {
  final List<TransactionModel> allTransactions;
  final List<TransactionModel> latestTransactions;

  final double currentBalance;
  final double totalIncome;
  final double totalExpense;

  final double needsProgress;
  final double wantsProgress;
  final double savingsProgress;

  final String needsPercentage;
  final String wantsPercentage;
  final String savingsPercentage;

  FinanceDataLoaded({
    required this.allTransactions,
    required this.latestTransactions,
    required this.currentBalance,
    required this.totalIncome,
    required this.totalExpense,
    required this.needsProgress,
    required this.wantsProgress,
    required this.savingsProgress,
    required this.needsPercentage,
    required this.wantsPercentage,
    required this.savingsPercentage,
  });
}
