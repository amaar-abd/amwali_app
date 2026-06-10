import 'package:amwali/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    this.text,

    this.isVisible = true,
    this.fontWeight,
    this.widget,
    this.color,
  });
  final VoidCallback? onPressed;
  final String? text;
  final bool isVisible;
  final FontWeight? fontWeight;
  final Widget? widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: 54,
          width: double.infinity,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: color ?? AppColors.primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child:
                widget ??
                Text(
                  text ?? '',
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                    color: AppColors.surfaceWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
