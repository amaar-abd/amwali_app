import 'package:amwali/core/theme/app_colors.dart';
import 'package:amwali/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: onTap,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.textGray,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        elevation: 0,
        selectedLabelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,

          inherit: true,
        ),
        unselectedLabelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(inherit: true),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4, top: 4),
              child: SvgPicture.asset(
                height: 22,
                Assets.assetsImagesSvgHome,
                colorFilter: ColorFilter.mode(
                  currentIndex == 0
                      ? AppColors.primaryGreen
                      : AppColors.textGray,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4, top: 4),
              child: SvgPicture.asset(
                Assets.assetsImagesSvgTransactions, height: 22,
                colorFilter: ColorFilter.mode(
                  currentIndex == 1
                      ? AppColors.primaryGreen
                      : AppColors.textGray,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'المعاملات',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4, top: 4),
              child: SvgPicture.asset(
                Assets.assetsImagesSvgAdvisor, height: 22,
                colorFilter: ColorFilter.mode(
                  currentIndex == 2
                      ? AppColors.primaryGreen
                      : AppColors.textGray,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'المستشار',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4, top: 4),
              child: SvgPicture.asset(
                Assets.assetsImagesSvgProfile, height: 22,
                colorFilter: ColorFilter.mode(
                  currentIndex == 3
                      ? AppColors.primaryGreen
                      : AppColors.textGray,
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'الحساب',
          ),
        ],
      ),
    );
  }
}
