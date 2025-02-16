import 'package:evently_app/core/routes/screens_route_name.dart';
import 'package:evently_app/ui/create_event/create_event_screen.dart';
import 'package:evently_app/ui/forget_password/forget_password_screen.dart';
import 'package:evently_app/ui/home/home_screen.dart';
import 'package:evently_app/ui/login/login_screen.dart';
import 'package:evently_app/ui/onboarding/on_boarding_screen.dart';
import 'package:evently_app/ui/register/register_screen.dart';
import 'package:evently_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../ui/onboarding/setup_screen.dart';

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

      case ScreensRouteName.createEvent:
        return MaterialPageRoute(
          builder: (context) => CreateEventScreen(),
          settings: settings,
        );

      case ScreensRouteName.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
          settings: settings,
        );

      case ScreensRouteName.setupScreen:
        return MaterialPageRoute(
          builder: (context) => const SetupScreen(),
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
