import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.forgetPasswordImage, height: .40.height,),
          SizedBox(height: 0.08.height,),
          TextButton(
              onPressed: () {},
              child: const Text("Reset Password"),
          ).setHorizontalPadding(context, enableMediaQuery: true, .03)
        ],
      ),
    );
  }
}
