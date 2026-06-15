import 'package:amwali/core/routing/app_routes.dart';
import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/core/utils/main_button.dart';
import 'package:amwali/features/on_boarding/presentation/widgets/on_boarding_skip_button.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.pageController,
    required this.pageIndex,
  });
  final String title;
  final String subTitle;
  final String imagePath;
  final PageController pageController;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Stack(
        alignment: AlignmentGeometry.topRight,
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.asset(imagePath),
              ),
              const SizedBox(height: 100),
              Text(title, style: TextTheme.of(context).displayLarge),
              const SizedBox(height: 20),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextTheme.of(
                  context,
                ).bodyLarge?.copyWith(color: AppColors.textDark),
              ),
              Spacer(),
              DotsIndicator(
                dotsCount: 3,
                position: pageIndex.toDouble(),
                decorator: DotsDecorator(
                  colors: [
                    AppColors.primaryGreen,

                    pageIndex >= 1
                        ? AppColors.primaryGreen
                        : AppColors.textGray.withAlpha(100),

                    pageIndex == 2
                        ? AppColors.primaryGreen
                        : AppColors.textGray.withAlpha(100),
                  ],
                  size: const Size(18.0, 9.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  activeColor: AppColors.primaryGreen,
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: MainButton(
                  onPressed: () async {
                    if (pageIndex == 0) {
                      pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                      );
                    } else if (pageIndex == 1) {
                      pageController.animateToPage(
                        2,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.bounceIn,
                      );
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.mainView,
                        (route) => true,
                      );
                    }
                  },
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pageIndex == 0 || pageIndex == 1
                            ? 'التالي'
                            : 'ابدأ الآن',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: AppColors.backgroundLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 25,
                        color: AppColors.backgroundLight,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
          if(pageIndex==0)
          OnBoardingSkipButton(),
          
        ],
      ),
    );
  }
}
