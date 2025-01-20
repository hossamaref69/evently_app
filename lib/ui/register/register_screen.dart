import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.logo,
              height: 0.21.height,
            ),
            const CustomTextFormField(
              label: "Name",
              icon: Icon(
                Icons.person,
                color: AppColors.grey,
              ),
            ).setOnlyPadding(
              context,
              top: 0.03,
              down: 0.01,
              right: 0.0,
              left: 0.0,
            ),
            const CustomTextFormField(
              label: "Email",
              icon: Icon(
                Icons.email_rounded,
                color: AppColors.grey,
              ),
            ).setOnlyPadding(
              context,
              top: 0.01,
              down: 0.01,
              right: 0.0,
              left: 0.0,
            ),
            const CustomTextFormField(
              label: "Password",
              obscureText: true,
              icon: Icon(
                Icons.lock,
                color: AppColors.grey,
              ),
            ).setOnlyPadding(
              context,
              top: 0.01,
              down: 0.01,
              right: 0.0,
              left: 0.0,
            ),
            const CustomTextFormField(
              label: "Re-Password",
              obscureText: true,
              icon: Icon(
                Icons.lock_rounded,
                color: AppColors.grey,
              ),
            ).setOnlyPadding(
              context,
              top: 0.01,
              down: 0.01,
              right: 0.0,
              left: 0.0,
            ),
            SizedBox(height: 0.01.height,),
            TextButton(
                onPressed: () {},
                child: const Text("Create Account")
            ),
            SizedBox(height: 0.02.height,),
            InkWell(
              onTap:() {
                Navigator.pop(context);
              } ,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account ? ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: AppColors.purpleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Intern"),
                  ),
                ],
              ),
            ),
          ],
        ).setHorizontalPadding(context, 0.03),
      ),
    );
  }
}
