import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:amwali/features/transactions/data/data_sources/transaction_local_data_source.dart';
import 'package:amwali/features/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl({required this.localDataSource});
  final TransactionLocalDataSource localDataSource;

  @override
  Future<void> addOrUpdateTransaction(TransactionModel transaction) async {
    await localDataSource.cacheTransaction(transaction);
  }

  @override
  Future<List<TransactionModel>> fetchLatestTransactions() async {
    return await localDataSource.getLatestTransactions();
  }

  @override
  Future<List<TransactionModel>> fetchTransactions({
    String? query,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return await localDataSource.getFilteredTransactions(
      query: query,
      type: type,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  Future<void> removeTransaction(int id) async {
    await localDataSource.deleteTransaction(id);
  }
}
