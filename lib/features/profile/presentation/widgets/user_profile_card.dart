import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF1A365D).withAlpha(25),
              border: Border.all(color: AppColors.primaryGreen, width: 2),
            ),
            child: const Icon(
              Icons.person_rounded,
              size: 55,
              color: Color(0xFF1A365D),
            ),
          ),
          const SizedBox(height: 12),

          const Text(
            'عمار عبد الرحمن',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A365D),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
