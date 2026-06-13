import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  const AddTransactionBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    bool isIncome = true;
    String selectedAccount = 'كاش';
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Container(
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
                    'إضافة معاملة جديدة',

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
                  'المبلغ',
                  style: TextTheme.of(context).bodyMedium?.copyWith(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
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
                  'المصدر / الحساب',
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
                      value: selectedAccount,
                      isExpanded: true,
                      items: ['كاش', 'بطاقة بنكية', 'محفظة رقمية']
                          .map(
                            (account) => DropdownMenuItem(
                              value: account,
                              child: Text(
                                account,
                                style: TextTheme.of(context).bodyMedium
                                    ?.copyWith(color: AppColors.textDark),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setModalState(() => selectedAccount = val!);
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
        );
      },
    );
  }
}
