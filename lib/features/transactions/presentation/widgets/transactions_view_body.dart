import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/home/presentation/widgets/transaction_items_list.dart';
import 'package:amwali/features/transactions/presentation/widgets/search_text_form_field.dart';
import 'package:amwali/features/transactions/presentation/widgets/transactions_category_item_list.dart';
import 'package:flutter/material.dart';

class TransactionsViewBody extends StatefulWidget {
  const TransactionsViewBody({super.key});

  @override
  State<TransactionsViewBody> createState() => _TransactionsViewBodyState();
}

class _TransactionsViewBodyState extends State<TransactionsViewBody> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            SizedBox(height: 10),
            SearchTextFormField(
              hintText: 'ابحث عن معاملة ...',
              controller: _searchController,
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _searchController.clear();
                      },
                      icon: const Icon(Icons.close, color: Colors.red),
                    )
                  : const SizedBox.shrink(),
              obscureText: false,
              prefixIcon: IconButton(
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {}
                },
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryGreen,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            TransactionsCategoryItemList(),
            SizedBox(height: 20),
            TransactionItemsList(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
