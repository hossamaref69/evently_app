import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/local_storage_keys.dart';
import '../../../../core/routes/screens_route_name.dart';
import '../../../../core/service/local_stronge_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../firebase_helper/auth/auth_helper.dart';

class ProfileTab extends StatefulWidget {

  ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late TextEditingController _themeController;

  late TextEditingController _languageController;

  final List<String> languages = ["Arabic", "English"];

  final List<String> themes = ["Light", "Dark"];

  @override
  void initState() {
    super.initState();
    _themeController = TextEditingController();
    _languageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _themeController.dispose();
    _languageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.20.height,
            decoration: const BoxDecoration(
              color: AppColors.purpleColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(64),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 124,
                    height: 124,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(1000),
                          bottomRight: Radius.circular(1000),
                          bottomLeft: Radius.circular(1000),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile_image.jpg"),
                        )),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  LocalStorageService.getUserName()?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                       LocalStorageService.getUserEmail()?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Language",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: .02.height,),
                CustomDropdown<String>(
                    items: languages,
                    onChanged: (p0) {},
                  decoration: CustomDropdownDecoration(
                    closedBorder:
                    Border.all(color: AppColors.purpleColor, width: 1.8),
                    closedBorderRadius: BorderRadius.circular(18.0),
                    closedSuffixIcon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 28,
                      color: AppColors.purpleColor,
                    ),
                  ),
                ),
                SizedBox(height: .02.height,),
                const Text(
                  "Theme",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: .02.height,),
                CustomDropdown<String>(
                  items: themes,
                  onChanged: (p0) {},
                  decoration: CustomDropdownDecoration(
                    closedBorder:
                    Border.all(color: AppColors.purpleColor, width: 1.8),
                    closedBorderRadius: BorderRadius.circular(18.0),
                    closedSuffixIcon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 28,
                      color: AppColors.purpleColor,
                    ),
                  ),
                ),
                SizedBox(height: .30.height,),
                TextButton(
                  onPressed: () {
                    AuthHelper().logout();
                    Navigator.pushReplacementNamed(context, ScreensRouteName.login);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffFF5659),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
