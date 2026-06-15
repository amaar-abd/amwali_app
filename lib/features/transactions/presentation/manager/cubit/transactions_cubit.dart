import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:amwali/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit(this.repository) : super(TransactionsInitial());
  final TransactionRepository repository;

  String currentType = 'الكل';
  String currentQuery = '';
  DateTime? currentStartDate;
  DateTime? currentEndDate;

  Future<void> fetchAllFinanceData({
    String? query,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    emit(TransactionsLoading());
    try {
      if (query != null) currentQuery = query;
      if (type != null) currentType = type;
      if (startDate != null) currentStartDate = startDate;
      if (endDate != null) currentEndDate = endDate;

      final transactionsFilter = await repository.fetchTransactions(
        query: currentQuery,
        type: currentType,
        startDate: currentStartDate,
        endDate: currentEndDate,);

      final latestTransactions = await repository.fetchLatestTransactions();

      final allTransaction = await repository.fetchTransactions(type: 'الكل');


      double incomeSum = 0.0;
      double expenseSum = 0.0;

      double needsSum = 0.0;
      double wantsSum = 0.0;
      double savingsSum = 0.0;

      for (var tx in allTransaction) {
        if (tx.type == 'income' || tx.type == 'دخل') {
          incomeSum += tx.amount;
        } else if (tx.type == 'expense' || tx.type == 'صرف') {
          expenseSum += tx.amount;

          if (tx.category == 'needs') needsSum += tx.amount;
          if (tx.category == 'wants') wantsSum += tx.amount;
          if (tx.category == 'savings') savingsSum += tx.amount;
        }
      }

      double balance = incomeSum - expenseSum;


      double needsProg = incomeSum > 0 ? (needsSum / incomeSum) : 0.0;
      double wantsProg = incomeSum > 0 ? (wantsSum / incomeSum) : 0.0;
      double savingsProg = incomeSum > 0 ? (savingsSum / incomeSum) : 0.0;


      emit(
        FinanceDataLoaded(
          allTransactions: transactionsFilter,
          latestTransactions: latestTransactions,
          currentBalance: balance,
          totalIncome: incomeSum,
          totalExpense: expenseSum,

          needsProgress: needsProg > 1.0 ? 1.0: needsProg,
          wantsProgress: wantsProg > 1.0 ? 1.0 : wantsProg,
          savingsProgress: savingsProg > 1.0 ? 1.0 : savingsProg,

          needsPercentage: '${(needsProg * 100).toStringAsFixed(0)}%',
          wantsPercentage: '${(wantsProg * 100).toStringAsFixed(0)}%',
          savingsPercentage: '${(savingsProg * 100).toStringAsFixed(0)}%',
        ),
      );
    } catch (_) {}

  }
  
  Future<void> clearDateFilter() async {
    currentStartDate = null;
    currentEndDate = null;
    await fetchAllFinanceData();
  }


  Future<void> saveTransaction(TransactionModel transaction) async {
    await repository.addOrUpdateTransaction(transaction);
    await fetchAllFinanceData(); 
  }


  Future<void> deleteTransaction(int id) async {
    await repository.removeTransaction(id);
    await fetchAllFinanceData();
  }
}

