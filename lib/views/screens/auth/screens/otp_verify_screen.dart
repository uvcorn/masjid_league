import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/action_button/action_button.dart';
import '../../../components/custom_checkbox/custom_checkbox.dart';
import '../../../components/custom_pin_code/custom_pin_code.dart';
import '../../../components/custom_text/custom_text.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpTEController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12.h),

                  /// Title
                  CustomText(
                    text: AppStrings.enterVerificationCode,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppStrings.oswaldFont,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),

                  /// Subtitle
                  CustomText(
                    text: AppStrings.enterVerificationCodeThatSentToYourEmail,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),

                  /// OTP Input
                  CustomPinCode(controller: otpTEController),
                  SizedBox(height: 36.h),

                  /// Resend text + Verify button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCheckbox(
                        showCheckbox: false,
                        leadingText: AppStrings.noCodeReceived,
                        clickableText: AppStrings.resendCode,
                        centerAlignment: true,
                        useSpaceBetweenAlignment: false,
                        leadingTextStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        clickableTextStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.secPrimary,
                          decorationThickness: 2.5.h,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.secPrimary,
                        ),
                        onLinkTap: () {
                          // Handle resend code
                        },
                      ),
                      SizedBox(height: 48.h),

                      /// Verify Button
                      ActionButton(
                        title: AppStrings.verifyButton,
                        textColor: AppColors.white,
                        onPressed: () {
                          Get.toNamed(AppRoutes.resetPasswordScreen);
                        },
                        backgroundColor: AppColors.secPrimary,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
