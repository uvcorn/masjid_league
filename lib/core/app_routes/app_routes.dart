import 'package:get/get.dart';
import '../../views/components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../views/screens/auth/screens/forgot_password_screen.dart';
import '../../views/screens/auth/screens/login_screen.dart';
import '../../views/screens/auth/screens/otp_verify_screen.dart';
import '../../views/screens/auth/screens/register_screen.dart';
import '../../views/screens/auth/screens/reset_password_screen.dart';
import '../../views/screens/home_section/screens/community_screen.dart';
import '../../views/screens/home_section/screens/post_update_screen.dart';
import '../../views/screens/home_section/screens/register_community_screen.dart';
import '../../views/screens/onboarding/onbording_screen.dart';
import '../../views/screens/onboarding/welcome_screen.dart';
import '../../views/screens/splash_screen/splash_screens.dart';
import '../../views/screens/tournament_drawer_section/screens/tournament_drawer_main_screen.dart';
import '../../views/screens/tournament_section/screens/choose_venue_screen.dart';
import '../../views/screens/tournament_section/screens/create_new_tournament.dart';
import '../../views/screens/tournament_section/screens/divisions_screen.dart';
import '../../views/screens/tournament_section/screens/payment_screen.dart';
import '../../views/screens/tournament_section/screens/promote_screen.dart';

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
  static const String postUpdateScreen = "/PostUpdateScreen";
  static const String createNewTournament = "/CreateNewTournament";
  static const String chooseVenueScreen = "/ChooseVenueScreen";
  static const String divisionsScreen = "/DivisionsScreen";
  static const String tournamentDrawerMainScreen =
      "/TournamentDrawerMainScreen";
  static const String promoteScreen = "/PromoteScreen";
  static const String paymentScreen = "/PaymentScreen";

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
    GetPage(name: postUpdateScreen, page: () => PostUpdateScreen()),
    GetPage(name: createNewTournament, page: () => CreateNewTournament()),
    GetPage(name: chooseVenueScreen, page: () => ChooseVenueScreen()),
    GetPage(name: divisionsScreen, page: () => DivisionsScreen()),
    GetPage(
      name: tournamentDrawerMainScreen,
      page: () => TournamentDrawerMainScreen(),
    ),
    GetPage(name: promoteScreen, page: () => PromoteScreen()),
    GetPage(name: paymentScreen, page: () => PaymentScreen()),
    // GetPage(name: communityScreen, page: () => CommunityScreen()),
    // GetPage(name: postUpdateScreen, page: () => PostUpdateScreen()),
  ];
}
