// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';

import '../../views/screens/auth/screens/forget_password_screen.dart';
import '../../views/screens/auth/screens/otp_verify_screen.dart';
import '../../views/screens/auth/screens/reset_password_screen.dart';
import '../../views/screens/auth/screens/sign_in_screen.dart';
import '../../views/screens/auth/screens/sign_up_screen.dart';
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
  static const String signInScreen = "/SignInScreen";
  static const String forgotPasswordScreen = "/ForgotPasswordScreen";
  static const String otpVerifyScreen = "/OtpVerifyScreen";
  static const String resetPasswordScreen = "/ResetPasswordScreen";
  static const String phoneInputScreen = "/PhoneInputScreen";

  ///===========================Home==========================

  static const String bottomNavBar = "/BottomNavBar";
  static const String homeScreen = "/HomeScreen";
  static const String groupScreen = "/GroupScreen";
  static const String postCreateScreens = "/PostCreateScreens";
  static const String notificationScreen = "/NotificationScreen";

  static const String postScreen = "/PostScreen";

  ///===========================Chats==========================
  static const String chatsListScreen = "/ChatsListScreen";
  static const String chatsScreen = "/ChatsScreen";

  ///===========================Profile==========================
  static const String profileScreen = "/ProfileScreen";
  static const String followersFollowingScreen = "/FollowersFollowingScreen";
  static const String yourClimateHistoryscreen = "/YourClimateHistoryscreen";
  // static const String followersFollowingScreen = "/FollowersFollowingScreen";
  ///===========================Workshop==========================
  static const String workshopDetailScreen = "/WorkshopDetailScreen";
  static const String reviewScreen = "/ReviewScreen";
  static const String workshopFinishScreen = "/WorkshopFinishScreen";
  static const String submitReviewScreen = "/SubmitReviewScreen";
  static const String workshopListScreen = "/YoureWorkshopListScreen";
  static const String workshopVideoConference = "/WorkshopVideoConference";
  static const String openNewWorkshopScreen = "/OpenNewWorkshopScreen";

  ///===========================SettingsScreens==========================
  static const String settingsScreens = "/SettingsScreens";
  static const String personalDetailsEditScreen = "/PersonalDetailsEditScreen";
  static const String interestScreen = "/InterestScreen";
  static const String passwordAndSecurityScreen = "/PasswordAndSecurityScreen";
  static const String linkedAccountsScreen = "/LinkedAccountsScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";

  static const String premiumUserDetailsScreen = "/PremiumUserDetailsScreen";
  static const String priceAndPaymentMethodScreen =
      "/PriceAndPaymentMethodScreen";
  static const String addCardDetailsScreen = "/AddCardDetailsScreen";
  static const String powerUserDetailsScreen = "/PowerUserDetailsScreen";
  static const String registrationPowerUserScreen =
      "/RegistrationPowerUserScreen";
  static const String successfullSubmitPowerUserScreen =
      "/SuccessfullSubmitPowerUserScreen";
  static const String introductionScreen = "/IntroductionScreen";
  static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static const String termsAndConditionScreen = "/TermsAndConditionScreen";
  static const String termsAndPolicyScreen = "/TermsAndPolicyScreen";
  static const String blockedListScreen = "/BlockedListScreen";
  static const String ntificationSettingsScreen = "/NotificationSettingsScreen";
  static const String savedWorkshopScreen = "/SavedWorkshopScreen";
  static const String clippedPostScreen = "/ClippedPostScreen";
  static const String attendedWorkshopScreen = "/AttendedWorkshopScreen";

  static List<GetPage> routes = [
    ///===========================Spalash & Onboarding==========================
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),

    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),

    ///===========================Authentication==========================
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: otpVerifyScreen, page: () => OtpVerifyScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),

    ///===========================Home==========================
  ];
}
