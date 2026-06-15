import 'package:isar_community/isar.dart';

part 'transaction_model.g.dart';


@collection
class TransactionModel {
  Id id = Isar.autoIncrement; 
@Index(type: IndexType.value, caseSensitive: false)
  String title;         
  double amount;      
  @Index()  
  DateTime date; 
  @Index()       
  String type;          
  String category;      

  TransactionModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });
}