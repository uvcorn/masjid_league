import 'package:get/get.dart';
import '../../views/components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../views/screens/auth/screens/forgot_password_screen.dart';
import '../../views/screens/auth/screens/login_screen.dart';
import '../../views/screens/auth/screens/otp_verify_screen.dart';
import '../../views/screens/auth/screens/register_screen.dart';
import '../../views/screens/auth/screens/reset_password_screen.dart';
import '../../views/screens/home/screens/community_screen.dart';
import '../../views/screens/home/screens/register_community_screen.dart';
import '../../views/screens/onboarding/onbording_screen.dart';
import '../../views/screens/onboarding/welcome_screen.dart';
import '../../views/screens/splash_screen/splash_screens.dart';

class AppRoutes {
  ///===========================Splash & Onboarding==========================
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/OnboardingScreen";

  static const String welcomeScreen = "/WelcomeScreen";

  ///===========================Authentication==========================
  static const String loginScreen = "/LoginScreen";
  static const String registerScreen = "/RegisterScreen";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String otpVerifyScreen = "/OtpVerifyScreen";
  static const String resetPasswordScreen = "/ResetPasswordScreen";

  ///===========================Home==========================
  static const String bottomNavBar = "/BottomNavBar";
  static const String registerCommunityScreen = "/RegisterCommunityScreen";
  static const String communityScreen = "/CommunityScreen";
  // static const String otpVerifyScreen = "/OtpVerifyScreen";
  // static const String resetPasswordScreen = "/ResetPasswordScreen";

  ///
  ///
  static List<GetPage> routes = [
    ///===========================Splash & Onboarding==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),

    ///===========================Authentication==========================
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: registerScreen, page: () => RegisterScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: otpVerifyScreen, page: () => OtpVerifyScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),

    ///===========================Home==========================
    GetPage(name: bottomNavBar, page: () => BottomNavBar()),
    GetPage(
      name: registerCommunityScreen,
      page: () => RegisterCommunityScreen(),
    ),
    GetPage(name: communityScreen, page: () => CommunityScreen()),
    //   GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
  ];
}
