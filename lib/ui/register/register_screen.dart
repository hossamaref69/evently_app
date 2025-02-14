import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/firebase_helper/auth/auth_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../core/constants/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.logo,
                height: 0.21.height,
              ),
              CustomTextField(
                label: "Name",
                onValidate: _nameValidator,
                controller: _nameController,
                prefixIcon: const Icon(
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
              CustomTextField(
                label: "Email",
                onValidate: _emailValidator,
                controller: _emailController,
                prefixIcon: const Icon(
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
              CustomTextField(
                label: "Password",
                controller: _passwordController,
                onValidate: _passwordValidator,
                maxLines: 1,
                isPassword: true,
                prefixIcon: const Icon(
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
              CustomTextField(
                controller: _rePasswordController,
                onValidate: _rePasswordValidator,
                label: "Re-Password",
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
              SizedBox(
                height: 0.01.height,
              ),
              TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      AuthHelper.register(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((value) {
                        if (value) {
                          Navigator.pop(context);
                        }
                      });
                    }
                  },
                  child: const Text("Create Account")),
              SizedBox(
                height: 0.02.height,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
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
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    } else if (!RegExp(r"^[a-zA-Z\u0600-\u06FF\s]{2,50}$").hasMatch(value)) {
      return "Enter a valid name (only letters and spaces)";
    }
    return null;
  }

  String? _rePasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
