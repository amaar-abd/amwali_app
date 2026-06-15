import 'package:amwali/core/local_database/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addOrUpdateTransaction(TransactionModel transaction);
  Future<void> removeTransaction(int id);
  Future<List<TransactionModel>> fetchTransactions({
    String? query,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<List<TransactionModel>> fetchLatestTransactions();
}