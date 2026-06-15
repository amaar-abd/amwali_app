import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/home/presentation/widgets/transaction_items_list.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_state.dart';
import 'package:amwali/features/transactions/presentation/widgets/search_text_form_field.dart';
import 'package:amwali/features/transactions/presentation/widgets/transactions_category_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsViewBody extends StatefulWidget {
  const TransactionsViewBody({super.key});

  @override
  State<TransactionsViewBody> createState() => _TransactionsViewBodyState();
}

class _TransactionsViewBodyState extends State<TransactionsViewBody> {
  late TextEditingController _searchController;
  String selectedCategory = 'الكل';

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
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryGreen),
          );
        }
        if (state is FinanceDataLoaded) {
          var filteredList = state.allTransactions;

          if (selectedCategory == 'الدخل') {
            filteredList = filteredList
                .where((tx) => tx.type == 'income' || tx.type == 'دخل')
                .toList();
          } else if (selectedCategory == 'الصرف') {
            filteredList = filteredList
                .where((tx) => tx.type == 'expense' || tx.type == 'صرف')
                .toList();
          } else if (selectedCategory == 'التاريخ') {
            filteredList.sort((a, b) => b.date.compareTo(a.date));
          }

          if (_searchController.text.isNotEmpty) {
            final query = _searchController.text.toLowerCase();

            filteredList = filteredList.where((tx) {
              return tx.title.toLowerCase().contains(query) ||
                  tx.amount.toString().contains(query);
            }).toList();
          }
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
                    prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryGreen,
                        size: 30,
                      
                    ),
                  ),
                  SizedBox(height: 20),
                  TransactionsCategoryItemList(
                    onCategoryChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TransactionItemsList(
                    isSearchPage: _searchController.text.isNotEmpty,
                    transactions: filteredList,
                    title: _searchController.text.isNotEmpty
                        ? 'نتائج البحث (${filteredList.length})'
                        : 'معاملات وفئات $selectedCategory',
                        
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
