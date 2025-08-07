import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/bottom_nav_bar/bottom_nav_bar.dart';
import '../../../components/bottom_nav_bar/bottom_nav_controller.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/reusable_button_row/reusable_button_row.dart';
import '../widgets/dynamic_text_field_list.dart';

class DivisionsScreen extends StatefulWidget {
  const DivisionsScreen({super.key});

  @override
  State<DivisionsScreen> createState() => _DivisionsScreenState();
}

class _DivisionsScreenState extends State<DivisionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: AppColors.black),
                    ),
                    SizedBox(width: 16.w),
                    CustomText(
                      text: AppStrings.divisions,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomText(
                  text: AppStrings.youCanCreateMoreDivision,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 32.h),

                DynamicTextFieldList(
                  fieldLabel: AppStrings.division,
                  initialValues: [''],
                  addAnotherLabel: AppStrings.addAnotherDivision,
                  minFields: 1,
                ),

                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: ReusableButtonRow(
          onCancelPressed: () {
            Get.back();
          },
          onNextPressed: () {
            final BottomNavController navController =
                Get.find<BottomNavController>();
            navController.changeIndex(0);
            Get.offAll(() => const BottomNavBar());
          },
          successMessage: AppStrings.tournamentSuccessMessage,
          isSuccess: true,
          nextText: AppStrings.done,
          cancelText: AppStrings.back,
        ),
      ),
    );
  }
}
