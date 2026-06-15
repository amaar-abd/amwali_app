import 'package:amwali/features/transactions/presentation/widgets/categories.dart';
import 'package:amwali/features/transactions/presentation/widgets/transactions_category_item.dart';
import 'package:flutter/material.dart';

class TransactionsCategoryItemList extends StatefulWidget {
  const TransactionsCategoryItemList({super.key, required this.onCategoryChanged});
final ValueChanged<String> onCategoryChanged;
  @override
  State<TransactionsCategoryItemList> createState() =>
      _TransactionsCategoryItemListState();
}

class _TransactionsCategoryItemListState
    extends State<TransactionsCategoryItemList> {
  int activeIndex = 0;
  final List<Categories> orderbyItemsList = [
    Categories(title: 'الكل',),
    Categories(title: 'الدخل', icon: Icons.trending_down),
    Categories(title: 'الصرف', icon: Icons.trending_up),
    Categories(title: 'التاريخ', icon: Icons.date_range_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: orderbyItemsList.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 15),
            child: TransactionsCategoryItem(
              icon: orderbyItemsList[index].icon,
              title: orderbyItemsList[index].title,
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                widget.onCategoryChanged(orderbyItemsList[index].title);
              },
              isSelected: activeIndex == index,
            ),
          );

        },
      ),
    );
  }
}
