// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';

import '../../views/screens/auth/screens/login_screen.dart';
import '../../views/screens/onboarding/onbording_screen.dart';
import '../../views/screens/onboarding/welcome_screen.dart';
import '../../views/screens/splash_screen/splash_screens.dart';

class AppRoutes {
  ///===========================Spalash & Onboarding==========================
  static const String splashScreen = "/SplashScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String onboardingScreen = "/OnboardingScreen";

  static const String welcomeScreen = "/WelcomeScreen";

  ///===========================Authentication==========================
  static const String loginScreen = "/LoginScreen";

  static List<GetPage> routes = [
    ///===========================Spalash & Onboarding==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),

    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),

    ///===========================Authentication==========================
    GetPage(name: loginScreen, page: () => LoginScreen()),

    ///===========================Home==========================
  ];
}
