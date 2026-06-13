import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/features/home/presentation/widgets/add_transaction_bottom_sheet.dart';
import 'package:amwali/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AddTransactionBottomSheet(),
          );
        },
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(child: const HomeViewBody()),
    );
  }
}
