import 'package:amwali/core/routing/app_routes.dart';
import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(AppRoutes.mainView);
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryGreen.withAlpha(200),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              width: 60,
              height: 34,
              child: Center(
                child: Text(
                  'تخطي',
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    color: AppColors.surfaceWhite,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
