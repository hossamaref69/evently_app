import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/models/onboarding.dart';
import 'package:evently_app/ui/onboarding/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.onboardingLogo).setHorizontalPadding(
                  context,
                  0.30,
                  enableMediaQuery: true,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: Onboarding.onboardingList.length,
                    itemBuilder: (context, index) {
                      return OnboardingItem(
                        onBoardingModel: Onboarding.onboardingList[index],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        if (_currentPage > 0) {
                          _currentPage--;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.purpleColor)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.purpleColor,
                          ),
                        ) ,
                      ),
                    ),
                    AnimatedSmoothIndicator(
                      activeIndex: _currentPage,
                      count: Onboarding.onboardingList.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: AppColors.purpleColor,
                        dotColor: const Color(0xff1C1C1C),
                        dotHeight: .01.height,
                        dotWidth: .01.height,
                        spacing: .02.width,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        if (_currentPage < Onboarding.onboardingList.length ) {
                          _currentPage++;
                        }
                        if (_currentPage == Onboarding.onboardingList.length) {
                          Navigator.pushNamed(context, ScreensRouteName.login);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.purpleColor)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.purpleColor,
                          ),
                        ) ,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
