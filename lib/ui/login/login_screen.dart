import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/firebase_helper/auth/auth_helper.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppAssets.logo,
                  height: 0.21.height,
                ),
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: AppColors.grey,
                  ),
                  onValidate: _emailValidator,
                ).setOnlyPadding(
                  context,
                  top: 0.03,
                  down: 0.01,
                  right: 0.0,
                  left: 0.0,
                ),
                CustomTextField(
                  controller: passwordController,
                  onValidate: _passwordValidator,
                  label: "Password",
                  maxLines: 1,
                  isPassword: true,
                  prefixIcon: const Icon(
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
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ScreensRouteName.forgetPassword);
                    },
                    child: const Text(
                      "Forget Password ? ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: AppColors.purpleColor, // Use your custom color
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthHelper.login(
                        email: emailController.text,
                        password: passwordController.text,
                      ).then((value) {
                        if (value) {
                          Navigator.pushNamed(context, ScreensRouteName.home);
                        }
                      });
                    }
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ScreensRouteName.register);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have Account ? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Create Account",
                        style: TextStyle(
                            color: AppColors.purpleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Intern"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      height: 2,
                      color: AppColors.purpleColor,
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.purpleColor,
                          fontSize: 16),
                    ),
                    Container(
                      width: 130,
                      height: 2,
                      color: AppColors.purpleColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    "Login With Google",
                    style: TextStyle(
                      color: AppColors.purpleColor,
                      fontSize: 18,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      side: const BorderSide(
                          width: 1.5, color: AppColors.purpleColor)
                  ),
                  icon: Image.asset(AppAssets.googleIcon, height: 0.03.height,),
                )
              ],
            ).setHorizontalPadding(
              context,
              enableMediaQuery: true,
              0.05,
            ),
          ),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

}