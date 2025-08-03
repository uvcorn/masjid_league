import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: AppStrings.forgotYourPassword,
                  fontSize: 20,
                  fontFamily: AppStrings.oswaldFont,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: AppStrings.enterYourEmailAddressToResetPassword,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(height: 30.h),

            /// Email Text Field
            CustomText(
              text: AppStrings.email,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),

            SizedBox(height: 10.h),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: AppStrings.email,
              controller: emailController,
              icon: Icons.email_outlined,
            ),
            const Spacer(),

            /// Get Verification Code Button
            CustomButton(
              text: AppStrings.getVerificationCode,
              onTap: () {
                Get.toNamed(AppRoutes.otpVerifyScreen);
              },
              selected: true,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
