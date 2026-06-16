import 'package:amwali/features/profile/presentation/widgets/reports_center_card.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          SizedBox(height: 10),
          ReportsCenterCard(),
        ],
      ),
    );
  }
}
