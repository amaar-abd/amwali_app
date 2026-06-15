import 'package:amwali/core/local_database/models/transaction_model.dart';

abstract class TransactionLocalDataSource {
  Future<void> cacheTransaction(TransactionModel transaction);

  Future<void> deleteTransaction(int id);

  Future<List<TransactionModel>> getFilteredTransactions({
    String? query,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  });

  Future<List<TransactionModel>> getLatestTransactions({int limit = 4});
}
