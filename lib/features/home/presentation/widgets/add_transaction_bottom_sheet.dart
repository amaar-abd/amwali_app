import 'package:amwali/core/local_database/models/transaction_model.dart';
import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/core/utils/custom_snackbar.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class AddTransactionBottomSheet extends StatefulWidget {
  const AddTransactionBottomSheet({super.key, this.transaction});
  final TransactionModel? transaction;
  @override
  State<AddTransactionBottomSheet> createState() =>
      _AddTransactionBottomSheetState();
}

class _AddTransactionBottomSheetState extends State<AddTransactionBottomSheet> {
  bool isIncome = true;
  String selectedCategory = 'salary';
  late TextEditingController _titleController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      _titleController = TextEditingController(text: widget.transaction!.title);
      _amountController = TextEditingController(
        text: widget.transaction!.amount.toString(),
      );
      isIncome =
          (widget.transaction!.type == 'دخل' ||
          widget.transaction!.type == 'income');
      selectedCategory = widget.transaction!.category;
    } else {
      _titleController = TextEditingController();
      _amountController = TextEditingController();
      selectedCategory = isIncome ? 'salary' : 'needs';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
    final bool isEditMode = widget.transaction != null;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Padding(
          padding: EdgeInsets.only(bottom: keyboardPadding),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      isEditMode ? 'تعديل المعاملة' : 'إضافة معاملة جديدة',

                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isIncome
                                ? Colors.green.shade600
                                : Colors.grey.shade100,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            setModalState(() => isIncome = true);
                            selectedCategory = 'salary';
                          },
                          icon: Icon(
                            Icons.arrow_downward,
                            color: isIncome ? Colors.white : Colors.black87,
                          ),
                          label: Text(
                            'دخل',
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: isIncome ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !isIncome
                                ? Colors.red.shade600
                                : Colors.grey.shade100,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            setModalState(() => isIncome = false);
                            selectedCategory = 'needs';
                          },
                          icon: Icon(
                            Icons.arrow_upward,
                            color: !isIncome ? Colors.white : Colors.black87,
                          ),
                          label: Text(
                            'مصروف',
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: !isIncome ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Text(
                    'عنوان المعاملة',
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'مثال: راتب، بقالة، غداء...',
                      hintStyle: TextTheme.of(
                        context,
                      ).bodyMedium?.copyWith(color: AppColors.textGray),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'المبلغ',
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    inputFormatters: [
    ThousandsFormatter(allowFraction: true), 
  ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '0',
                      suffixText: 'ل.س  ',
                      suffixStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    'تصنيف الفئة (المستشار المالي)',
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(16),
                        dropdownColor: Colors.white,
                        value: selectedCategory,
                        isExpanded: true,
                        style: TextTheme.of(
                          context,
                        ).bodyMedium?.copyWith(color: AppColors.textDark),
                        items: isIncome
                            ? const [
                                DropdownMenuItem(
                                  value: 'salary',
                                  child: Text('الراتب الشهري'),
                                ),
                                DropdownMenuItem(
                                  value: 'investment',
                                  child: Text('عوائد واستثمار'),
                                ),
                                DropdownMenuItem(
                                  value: 'freelance',
                                  child: Text('عمل إضافي / حر'),
                                ),
                              ]
                            : const [
                                DropdownMenuItem(
                                  value: 'needs',
                                  child: Text('الاحتياجات الضرورية'),
                                ),
                                DropdownMenuItem(
                                  value: 'wants',
                                  child: Text('الرغبات والترفيه'),
                                ),
                                DropdownMenuItem(
                                  value: 'savings',
                                  child: Text('الادخار والاستثمار'),
                                ),
                              ],
                        onChanged: (val) {
                          setModalState(() => selectedCategory = val!);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        if (_titleController.text.isEmpty ||
                            _amountController.text.isEmpty) {
                          customSnackBar(
                            context,
                            'الرجاء إدخال العنوان و المبلغ',
                            Colors.red,
                          );
                          return;
                        }
                        final double? amount = double.tryParse(
                          _amountController.text.replaceAll(',',''),
                        );
                        if (amount == null || amount <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('الرجاء إدخال مبلغ صحيح'),
                            ),
                          );
                          return;
                        }

                        final newTransaction = TransactionModel(
                          title: _titleController.text,
                          amount: amount,
                          type: isIncome ? 'دخل' : 'صرف',
                          date: isEditMode
                              ? widget.transaction!.date
                              : DateTime.now(),
                          category: selectedCategory,
                        );
                        if (isEditMode) {
                          newTransaction.id = widget.transaction!.id;
                        }
                        context.read<TransactionsCubit>().saveTransaction(
                          newTransaction,
                        );
                        Navigator.pop(context);
                      },

                      child: Text(
                        'حفظ المعاملة',
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: AppColors.backgroundLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
