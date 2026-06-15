import 'package:amwali/features/transactions/data/data_sources/transaction_local_data_source.dart';
import 'package:amwali/features/transactions/data/data_sources/transaction_local_data_source_impl.dart';
import 'package:amwali/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:amwali/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';

final getIt = GetIt.instance;

void setupServiceLocator(Isar isarInstance) {
  getIt.registerSingleton<Isar>(isarInstance);

  getIt.registerLazySingleton<TransactionLocalDataSource>(
    () => TransactionLocalDataSourceImpl(isar: getIt<Isar>()),
  );

  getIt.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(
      localDataSource: getIt<TransactionLocalDataSource>(),
    ),
  );

  getIt.registerFactory<TransactionsCubit>(
    () => TransactionsCubit(getIt<TransactionRepository>()),
  );
}
