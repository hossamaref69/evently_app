import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/ui/forget_password/forget_password_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/login/login_screen.dart';
import 'package:evently_app/ui/register/register_screen.dart';
import 'package:evently_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreensRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );

      case ScreensRouteName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );

      case ScreensRouteName.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
          settings: settings,
        );

      case ScreensRouteName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
          settings: settings,
        );

      case ScreensRouteName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
    }
  }
}
