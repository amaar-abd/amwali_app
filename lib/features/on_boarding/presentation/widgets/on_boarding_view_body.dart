
import 'package:amwali/core/utils/app_images.dart';
import 'package:amwali/features/on_boarding/presentation/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      children: [
        CustomPageView(
          imagePath: Assets.assetsImagesOnboarding1,
          title: 'تتبع مصروفك بسهولة تامة',
          subTitle:
              'نظم فواتيرك وسجلاتك المالية بلمسة واحدة. تطبيق أموالي يساعدك على فهم أين تذهب أموالك بدقة عالية',
          pageController: pageController,
          pageIndex: pageIndex,
        ),
        CustomPageView(
          imagePath: Assets.assetsImagesOnboarding2,
          title: 'استشارات مالية ذكية',
          subTitle:
              'وازن بين احتياجاتك ورغباتك ومدخراتك باستخدام القاعدة العالمية لتحقيق الاستقرار المالي.',
          pageController: pageController,
          pageIndex: pageIndex,
        ),
        CustomPageView(
          imagePath: Assets.assetsImagesOnboarding3,
          title: 'تقارير مالية بنقرة واحدة',
          subTitle:
              'استخرج تقارير مصاريفك الشهرية والسنوية بصيغة PDF أو ورقية بكل سهولة لتتبع أدق التفاصيل.',
          pageController: pageController,
          pageIndex: pageIndex,
        ),
      ],
    );
  }
}
