import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_checkbox/custom_checkbox.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';
import '../widgets/language_choose.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool agreeWith = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.r,
                        color: AppColors.black,
                      ),
                    ),
                    LanguageChoose(),
                  ],
                ),

                SizedBox(height: 10.h),
                Center(
                  child: CustomText(
                    text: AppStrings.welcomeBackCreateAnAccount,
                    fontSize: 20,
                    fontFamily: AppStrings.oswaldFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Center(
                  child: CustomText(
                    text: AppStrings.fillInYourInformation,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 44.h),

                /// Email
                Text(AppStrings.fullName, style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 10.h),
                CustomTextField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  hintText: AppStrings.fullName,
                  controller: fullNameController,
                  icon: Icons.person,
                ),
                SizedBox(height: 20.h),

                /// Password
                Text(AppStrings.email, style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 10.h),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  hintText: AppStrings.email,
                  controller: emailController,
                  icon: Icons.email_rounded,
                ),

                SizedBox(height: 10.h),
                Text(AppStrings.password, style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 10.h),
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  hintText: AppStrings.password,
                  controller: passwordController,
                  icon: Icons.lock,
                  isPassword: true,
                  obscureText: obscurePassword,
                  togglePassword: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),

                SizedBox(height: 10.h),
                Text(AppStrings.password, style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 10.h),
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: AppStrings.password,
                  controller: confirmPasswordController,
                  icon: Icons.lock,
                  isPassword: true,
                  obscureText: obscurePassword,
                  togglePassword: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),

                SizedBox(height: 10.h),

                /// Agree
                CustomCheckbox(
                  useSpaceBetweenAlignment: false,
                  showCheckbox: true,
                  leadingText: AppStrings.agreeWith,
                  leadingTextStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
                  clickableText: AppStrings.termsAndConditions,
                  clickableTextStyle: TextStyle(
                    color: AppColors.mediumGray,
                    fontSize: 14.sp,
                  ),
                  onLinkTap: () {},
                ),

                SizedBox(height: 40.h),

                /// Sign up Button
                CustomButton(
                  selected: true,
                  text: AppStrings.signUp,
                  onTap: () {
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                ),

                SizedBox(height: 28.h),

                /// Sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CustomCheckbox(
                        leadingText: AppStrings.alreadyHaveAnAccount,
                        leadingTextStyle: TextStyle(color: AppColors.black),
                        clickableText: AppStrings.signIn,
                        clickableTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: AppColors.secPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.secPrimary,
                          decorationThickness: 2,
                        ),
                        onLinkTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
