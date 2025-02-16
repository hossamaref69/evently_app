import 'dart:async';

import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/constants/local_storage_keys.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/core/service/local_stronge_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      var isFirstTime =
          LocalStorageService.getBool(LocalStorageKeys.isFirstTimeRun) ?? true;
      Navigator.pushReplacementNamed(
        context,
        isFirstTime ? ScreensRouteName.setupScreen : ScreensRouteName.login,
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.logo,
            height: 0.25.height,
          ),
        ],
      ),
    ));
  }
}
