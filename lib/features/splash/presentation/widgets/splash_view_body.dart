import 'package:amwali/core/routing/app_routes.dart';
import 'package:amwali/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Opacity(
            opacity: 0.30,
            child: Image.asset(
              Assets.assetsImagesBackgroundSplash1,

              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Image.asset(
            Assets.assetsImagesLogoWithoutBackground,
            height: 250,
          ),
        ),
      ],
    );
  }

  void nextPage() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushNamed(AppRoutes.onBoardingView);
      }
    });
  }
}
