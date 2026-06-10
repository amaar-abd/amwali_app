import 'package:amwali/core/routing/app_routes.dart';
import 'package:amwali/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:amwali/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
 static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case AppRoutes.onBoardingView:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}
