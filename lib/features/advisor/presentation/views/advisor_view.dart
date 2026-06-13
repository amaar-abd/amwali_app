import 'package:amwali/features/advisor/presentation/widgets/advisor_view_body.dart';
import 'package:flutter/material.dart';

class AdvisorView extends StatelessWidget {
  const AdvisorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:const SafeArea(child: AdvisorViewBody()));
  }
}
