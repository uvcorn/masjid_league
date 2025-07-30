// // ignore_for_file: prefer_const_constructors
// import 'package:get/get.dart';
// import '../../../view/components/bottom_nav_bar/bottom_nav_bar.dart';
// import '../../../view/screens/group/models/workshop_model.dart';
// import '../../../view/screens/home/models/post_model.dart';
// import '../../../view/screens/home/screens/post_screen.dart';
// import '../../../view/screens/notification/notification_screen.dart';
// import '../../../view/screens/auth/screens/forget_password_screen.dart';
// import '../../../view/screens/auth/screens/otp_verify_screen.dart';
// import '../../../view/screens/auth/screens/phone_input_screen.dart';
// import '../../../view/screens/auth/screens/reset_password_screen.dart';
// import '../../../view/screens/auth/screens/sign_in_screen.dart';
// import '../../../view/screens/auth/screens/sign_up_screen.dart';
// import '../../../view/screens/chat/screens/chats_list_screen.dart';
// import '../../../view/screens/group/screens/group_screen.dart';
// import '../../../view/screens/group/screens/review_screen.dart';
// import '../../../view/screens/group/screens/submit_review_screen.dart';
// import '../../../view/screens/group/screens/workshop_details_screen.dart';
// import '../../../view/screens/group/screens/workshop_finish_screen.dart';
// import '../../../view/screens/group/screens/youre_workshop_list_screen.dart';
// import '../../../view/screens/group/screens/workshop_video_conference.dart';
// import '../../../view/screens/home/screens/home_screen.dart';
// import '../../../view/screens/chat/screens/chats_screen.dart';
// import '../../../view/screens/onboarding/first_onbording_screen.dart';
// import '../../../view/screens/onboarding/secend_onbording_screen.dart';
// import '../../../view/screens/onboarding/third_onbording_screen.dart';
// import '../../../view/screens/open_new_workshop/open_new_workshop_screen.dart';
// import '../../../view/screens/post/views/post_create_screens.dart';
// import '../../../view/screens/power_section/screens/power_user_details_screen.dart';
// import '../../../view/screens/power_section/screens/registration_power_user_screen.dart';
// import '../../../view/screens/power_section/screens/successfull_submit_power_user_screen.dart';
// import '../../../view/screens/premium_section/screens/add_card_details_screen.dart';
// import '../../../view/screens/premium_section/screens/premium_user_details_screen.dart';
// import '../../../view/screens/premium_section/screens/price_and_payment_method_screen.dart';
// import '../../../view/screens/profile/screens/attended_workshop_screen.dart';
// import '../../../view/screens/profile/screens/followers_following_screen.dart';
// import '../../../view/screens/profile/screens/profile_screen.dart';
// import '../../../view/screens/profile/screens/your_climate_historyscreen.dart';
// import '../../../view/screens/settings/activity_section/blocked_list_screen.dart';
// import '../../../view/screens/settings/activity_section/clipped_post_screen.dart';
// import '../../../view/screens/settings/activity_section/notification_settings_screen.dart';
// import '../../../view/screens/settings/activity_section/saved_workshop_screen.dart';
// import '../../../view/screens/settings/company_section/privacy_policy_screen.dart';
// import '../../../view/screens/settings/company_section/terms_and_condition_screen.dart';
// import '../../../view/screens/settings/company_section/terms_and_policy_screen.dart';
// import '../../../view/screens/settings/personal_details_edit/personal_details_edit_screen.dart';
// import '../../../view/screens/settings/password_and_security/screens/change_password_screen.dart';
// import '../../../view/screens/settings/company_section/introduction_screen.dart';
// import '../../../view/screens/settings/password_and_security/screens/linked_accounts_screen.dart';
// import '../../../view/screens/settings/password_and_security/screens/password_and_security_screen.dart';
// import '../../../view/screens/settings/screen/interest_screen.dart';
// import '../../../view/screens/settings/screen/settings_screens.dart';
// import '../../../view/screens/splash_screen/splash_screens.dart';

// class AppRoutes {
//   ///===========================Spalash & Onboarding==========================
//   static const String splashScreen = "/SplashScreen";
//   static const String signUpScreen = "/SignUpScreen";
//   static const String secendOnbordingScreen = "/SecendOnbordingScreen";
//   static const String thirdOnbordingScreen = "/ThirdOnbordingScreen";

//   ///===========================Authentication==========================
//   static const String signInScreen = "/SignInScreen";
//   static const String forgotPasswordScreen = "/ForgotPasswordScreen";
//   static const String otpVerifyScreen = "/OtpVerifyScreen";
//   static const String firstOnbordingScreen = "/FirstOnbordingScreen";
//   static const String resetPasswordScreen = "/ResetPasswordScreen";
//   static const String phoneInputScreen = "/PhoneInputScreen";

//   ///===========================Home==========================

//   static const String bottomNavBar = "/BottomNavBar";
//   static const String homeScreen = "/HomeScreen";
//   static const String groupScreen = "/GroupScreen";
//   static const String postCreateScreens = "/PostCreateScreens";
//   static const String notificationScreen = "/NotificationScreen";

//   static const String postScreen = "/PostScreen";

//   ///===========================Chats==========================
//   static const String chatsListScreen = "/ChatsListScreen";
//   static const String chatsScreen = "/ChatsScreen";

//   ///===========================Profile==========================
//   static const String profileScreen = "/ProfileScreen";
//   static const String followersFollowingScreen = "/FollowersFollowingScreen";
//   static const String yourClimateHistoryscreen = "/YourClimateHistoryscreen";
//   // static const String followersFollowingScreen = "/FollowersFollowingScreen";
//   ///===========================Workshop==========================
//   static const String workshopDetailScreen = "/WorkshopDetailScreen";
//   static const String reviewScreen = "/ReviewScreen";
//   static const String workshopFinishScreen = "/WorkshopFinishScreen";
//   static const String submitReviewScreen = "/SubmitReviewScreen";
//   static const String workshopListScreen = "/YoureWorkshopListScreen";
//   static const String workshopVideoConference = "/WorkshopVideoConference";
//   static const String openNewWorkshopScreen = "/OpenNewWorkshopScreen";

//   ///===========================SettingsScreens==========================
//   static const String settingsScreens = "/SettingsScreens";
//   static const String personalDetailsEditScreen = "/PersonalDetailsEditScreen";
//   static const String interestScreen = "/InterestScreen";
//   static const String passwordAndSecurityScreen = "/PasswordAndSecurityScreen";
//   static const String linkedAccountsScreen = "/LinkedAccountsScreen";
//   static const String changePasswordScreen = "/ChangePasswordScreen";

//   static const String premiumUserDetailsScreen = "/PremiumUserDetailsScreen";
//   static const String priceAndPaymentMethodScreen =
//       "/PriceAndPaymentMethodScreen";
//   static const String addCardDetailsScreen = "/AddCardDetailsScreen";
//   static const String powerUserDetailsScreen = "/PowerUserDetailsScreen";
//   static const String registrationPowerUserScreen =
//       "/RegistrationPowerUserScreen";
//   static const String successfullSubmitPowerUserScreen =
//       "/SuccessfullSubmitPowerUserScreen";
//   static const String introductionScreen = "/IntroductionScreen";
//   static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
//   static const String termsAndConditionScreen = "/TermsAndConditionScreen";
//   static const String termsAndPolicyScreen = "/TermsAndPolicyScreen";
//   static const String blockedListScreen = "/BlockedListScreen";
//   static const String ntificationSettingsScreen = "/NotificationSettingsScreen";
//   static const String savedWorkshopScreen = "/SavedWorkshopScreen";
//   static const String clippedPostScreen = "/ClippedPostScreen";
//   static const String attendedWorkshopScreen = "/AttendedWorkshopScreen";

//   static List<GetPage> routes = [
//     ///===========================Spalash & Onboarding==========================
//     GetPage(name: splashScreen, page: () => SplashScreen()),
//     GetPage(name: firstOnbordingScreen, page: () => FirstOnbordingScreen()),
//     GetPage(name: secendOnbordingScreen, page: () => SecendOnbordingScreen()),
//     GetPage(name: thirdOnbordingScreen, page: () => ThirdOnbordingScreen()),

//     ///===========================Authentication==========================
//     GetPage(name: signInScreen, page: () => SignInScreen()),
//     GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
//     GetPage(name: otpVerifyScreen, page: () => OtpVerifyScreen()),
//     GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
//     GetPage(name: signUpScreen, page: () => SignUpScreen()),
//     GetPage(name: phoneInputScreen, page: () => PhoneInputScreen()),

//     ///===========================Home==========================
//     GetPage(name: bottomNavBar, page: () => BottomNavBar()),
//     GetPage(name: homeScreen, page: () => HomeScreen()),
//     GetPage(name: groupScreen, page: () => GroupScreen()),
//     GetPage(name: postCreateScreens, page: () => PostCreateScreens()),
//     GetPage(name: notificationScreen, page: () => NotificationScreen()),

//     GetPage(
//       name: AppRoutes.postScreen,
//       page: () {
//         final post = Get.arguments as Post; // cast it to your Post model
//         return PostScreen(post: post);
//       },
//     ),

//     ///===========================Chats==========================
//     GetPage(name: chatsListScreen, page: () => ChatsListScreen()),
//     GetPage(name: chatsScreen, page: () => ChatsScreen()),

//     ///===========================Profile==========================
//     GetPage(name: profileScreen, page: () => ProfileScreen()),
//     GetPage(
//       name: followersFollowingScreen,
//       page: () => FollowersFollowingScreen(),
//     ),
//     GetPage(
//       name: yourClimateHistoryscreen,
//       page: () => YourClimateHistoryscreen(),
//     ),
//     // GetPage(name: profileScreen, page: () => ProfileScreen()),

//     ///===========================Workshop==========================
//     GetPage(
//       name: AppRoutes.workshopDetailScreen,
//       page: () {
//         final WorkshopModel workshop = Get.arguments;
//         return WorkshopDetailScreen(workshop: workshop);
//       },
//     ),

//     GetPage(name: reviewScreen, page: () => ReviewScreen()),
//     GetPage(name: workshopFinishScreen, page: () => WorkshopFinishScreen()),
//     GetPage(name: submitReviewScreen, page: () => SubmitReviewScreen()),
//     GetPage(name: workshopListScreen, page: () => YoureWorkshopListScreen()),
//     GetPage(
//       name: workshopVideoConference,
//       page: () => WorkshopVideoConference(),
//     ),
//     GetPage(name: openNewWorkshopScreen, page: () => OpenNewWorkshopScreen()),

//     ///===========================SettingsScreens==========================
//     GetPage(name: settingsScreens, page: () => SettingsScreens()),
//     GetPage(
//       name: personalDetailsEditScreen,
//       page: () => PersonalDetailsEditScreen(),
//     ),
//     GetPage(name: interestScreen, page: () => InterestScreen()),
//     GetPage(
//       name: passwordAndSecurityScreen,
//       page: () => PasswordAndSecurityScreen(),
//     ),
//     GetPage(name: linkedAccountsScreen, page: () => LinkedAccountsScreen()),
//     GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
//     GetPage(
//       name: premiumUserDetailsScreen,
//       page: () => PremiumUserDetailsScreen(),
//     ),

//     GetPage(
//       name: priceAndPaymentMethodScreen,
//       page: () => PriceAndPaymentMethodScreen(),
//     ),
//     GetPage(name: addCardDetailsScreen, page: () => AddCardDetailsScreen()),
//     GetPage(name: powerUserDetailsScreen, page: () => PowerUserDetailsScreen()),
//     GetPage(
//       name: registrationPowerUserScreen,
//       page: () => RegistrationPowerUserScreen(),
//     ),
//     GetPage(
//       name: successfullSubmitPowerUserScreen,
//       page: () => SuccessfullSubmitPowerUserScreen(),
//     ),
//     GetPage(name: introductionScreen, page: () => IntroductionScreen()),
//     GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
//     GetPage(
//       name: termsAndConditionScreen,
//       page: () => TermsAndConditionScreen(),
//     ),
//     GetPage(name: termsAndPolicyScreen, page: () => TermsAndPolicyScreen()),

//     GetPage(name: blockedListScreen, page: () => BlockedListScreen()),
//     GetPage(
//       name: ntificationSettingsScreen,
//       page: () => NotificationSettingsScreen(),
//     ),
//     GetPage(name: savedWorkshopScreen, page: () => SavedWorkshopScreen()),
//     GetPage(name: clippedPostScreen, page: () => ClippedPostScreen()),
//     GetPage(name: attendedWorkshopScreen, page: () => AttendedWorkshopScreen()),
//   ];
// }
