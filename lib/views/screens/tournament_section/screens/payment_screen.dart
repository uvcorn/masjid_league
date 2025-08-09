import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/success_dialog.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Country? selectedCountry;
  @override
  void initState() {
    super.initState();
    selectedCountry = Country.parse('US'); // ISO code for United States
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back & Title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 16.w),
                    CustomText(
                      text: AppStrings.payment,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                // Stepper
                Center(
                  child: CustomStepper(
                    currentStep: 2,
                    labels: [
                      AppStrings.details,
                      AppStrings.payment,
                      AppStrings.confirm,
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // Credit Card Image
                Center(child: CustomImage(imageSrc: AppImages.creditCard)),
                SizedBox(height: 24.h),

                _buildInputField(AppStrings.email, AppStrings.eMail),
                SizedBox(height: 12.h),
                _buildInputField(AppStrings.cardNumber, AppStrings.cardNumbers),
                SizedBox(height: 12.h),

                Row(
                  children: [
                    Expanded(
                      child: _buildInputField(
                        AppStrings.expiration,
                        AppStrings.monthAndYear,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _buildInputField(
                        AppStrings.cvc,
                        AppStrings.cvc,
                        isPassword: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                _buildCountryPickerField(),
                SizedBox(height: 24.h),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => SuccessDialog(
                          onHomePressed: () {
                            SnackbarHelper.show(
                              message: AppStrings.paymentMessage,
                              backgroundColor: AppColors.primary,
                              textColor: AppColors.white,
                              isSuccess: true,
                            );
                            final BottomNavController navController =
                                Get.find<BottomNavController>();
                            navController.changeIndex(0);
                            Get.offAll(() => const BottomNavBar());
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: CustomText(
                      text: AppStrings.continueA,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Country Picker Field
  Widget _buildCountryPickerField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Country',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: (Country country) {
                setState(() {
                  selectedCountry = country;
                });
              },
            );
          },
          child: Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.mediumGray),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                CustomText(
                  text: selectedCountry?.name ?? 'USA',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: selectedCountry == null
                      ? AppColors.mediumGray
                      : AppColors.black,
                ),
                Spacer(),
                Icon(Icons.keyboard_arrow_down, color: AppColors.mediumGray),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Reusable Input Field Builder
  Widget _buildInputField(
    String label,
    String hint, {
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        SizedBox(height: 6.h),
        Container(
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.mediumGray),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: AppColors.mediumGray,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              if (isPassword)
                Icon(
                  Icons.visibility_off_outlined,
                  color: AppColors.mediumGray,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
