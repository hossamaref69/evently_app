import 'dart:async';

import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
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
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          ScreensRouteName.home,
          (route) => false,
        );
      },
    );
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
