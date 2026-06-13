import 'package:amwali/features/advisor/presentation/widgets/budget_analysis_card.dart';
import 'package:flutter/material.dart';

class AdvisorViewBody extends StatelessWidget {
  const AdvisorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(children: [
        const SizedBox(height: 10,),
        BudgetAnalysisCard()
      ]),
    );
  }
}
