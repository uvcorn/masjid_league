import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obscurePassword = true;

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: BackButton(color: AppColors.black),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          // This is the outer Column
          children: [
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: AppStrings.nowResetYourPassword,
                  fontSize: 20,
                  fontFamily: AppStrings.oswaldFont,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: AppStrings.enterVerificationCodeThatSentToYourEmail,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(height: 30.h),

            // Wrap this Column with Expanded
            Expanded(
              child: Column(
                // This is the inner Column with the Spacer
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.newPassword,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: 10.h),
                  CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    hintText: AppStrings.password,
                    controller: newPasswordController,
                    icon: Icons.lock_outline,
                    isPassword: true,
                    obscureText: obscurePassword,
                    togglePassword: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: AppStrings.confirmNewPassword,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: 10.h),
                  CustomTextField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: AppStrings.password,
                    controller: confirmNewPasswordController,
                    icon: Icons.lock_outline,
                    isPassword: true,
                    obscureText: obscurePassword,
                    togglePassword: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    text: AppStrings.savePassword,
                    onTap: () {
                      Get.toNamed(AppRoutes.loginScreen);
                    },
                    selected: true,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
