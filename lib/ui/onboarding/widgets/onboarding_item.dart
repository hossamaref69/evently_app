import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/models/onboarding.dart';
import 'package:flutter/cupertino.dart';

class OnboardingItem extends StatelessWidget {
  Onboarding onBoardingModel;
  OnboardingItem({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: .05.height ,),
          SizedBox(
            width: 360 ,
            height: 360,
            child: Image.asset(
              onBoardingModel.imagePath,
            ),
          ),
          SizedBox(height: .04.height ,),
          Text(
            onBoardingModel.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Intern",
                color: AppColors.purpleColor),
          ),
          SizedBox(height: .05.height ,),
          Text(
            textAlign: TextAlign.left,
            onBoardingModel.desc,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: "Intern",
                color: AppColors.blackColor),
          ),
        ],
      ),
    );
  }
}
