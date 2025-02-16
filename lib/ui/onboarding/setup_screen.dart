import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/core/service/local_stronge_service.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/constants/local_storage_keys.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  @override
  void initState() {
    super.initState();
    LocalStorageService.setBool(LocalStorageKeys.isFirstTimeRun, false);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.onboardingLogo).setHorizontalPadding(
              context,
              0.30,
              enableMediaQuery: true,
            ),
            SizedBox(
              height: .03.height,
            ),
            Image.asset("assets/images/being_creative.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Personalize Your Experience",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.purpleColor),
                  ),
                  SizedBox(
                    height: .02.height,
                  ),
                  const Text(
                    "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor),
                  ),
                  SizedBox(
                    height: .03.height,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Language",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.purpleColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: .02.height,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Theme",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.purpleColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: .02.height,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ScreensRouteName.onBoardingScreen);
                    },
                    child: const Text(
                      "Let’s Start",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
