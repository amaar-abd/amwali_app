import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';


class IsarService {
  late Isar db;
  Future<void> isarInit() async {

    final dir = await getApplicationDocumentsDirectory();
    

    db = await Isar.open(
      [TransactionModelSchema],
      directory: dir.path,
    );
  }
}