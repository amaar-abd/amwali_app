import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: TextTheme(
      displayLarge: AppTypography.headline1,
      displayMedium: AppTypography.headline2,
      bodyLarge: AppTypography.bodyText1,
      bodyMedium: AppTypography.bodyText2,
      bodySmall: AppTypography.bodyText3,
      labelSmall: AppTypography.caption,
    ),
  );
}
