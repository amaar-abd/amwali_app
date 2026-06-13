import 'package:amwali/features/transactions/presentation/widgets/transactions_view_body.dart';
import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const TransactionsViewBody()));
  }
}