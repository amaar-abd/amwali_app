import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:amwali/features/transactions/data/data_sources/transaction_local_data_source.dart';
import 'package:isar_community/isar.dart';

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  TransactionLocalDataSourceImpl({required this.isar});
  final Isar isar;

  @override
  Future<void> cacheTransaction(TransactionModel transaction) async {
    await isar.writeTxn(() async {
      await isar.transactionModels.put(transaction);
    });
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await isar.writeTxn(() async {
      await isar.transactionModels.delete(id);
    });
  }

  @override
  Future<List<TransactionModel>> getFilteredTransactions({
    String? query,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    QueryBuilder<TransactionModel, TransactionModel, QAfterFilterCondition>
    builder;

    if (type != null && type != 'الكل' && type.isNotEmpty) {
      final String systemType = (type == 'دخل') ? 'income' : 'expense';
      builder = isar.transactionModels.filter().typeEqualTo(systemType);
    } else {
      builder = isar.transactionModels.filter().idGreaterThan(-1);
    }

    if (query != null && query.isNotEmpty) {
      builder = builder.titleContains(query, caseSensitive: false);
    }

    if (startDate != null && endDate != null) {
      builder = builder.dateBetween(startDate, endDate);
    }

    return await builder.sortByDateDesc().findAll();
  }

  @override
  Future<List<TransactionModel>> getLatestTransactions({int limit = 4}) async {
    return await isar.transactionModels
        .where()
        .sortByDateDesc()
        .limit(limit)
        .findAll();
  }
}
