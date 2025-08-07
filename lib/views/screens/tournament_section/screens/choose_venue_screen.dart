import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/reusable_button_row/reusable_button_row.dart';
import '../widgets/dynamic_text_field_list.dart';

class ChooseVenueScreen extends StatefulWidget {
  const ChooseVenueScreen({super.key});

  @override
  State<ChooseVenueScreen> createState() => _ChooseVenueScreenState();
}

class _ChooseVenueScreenState extends State<ChooseVenueScreen> {
  bool isOnlineTournament = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: AppColors.black),
                    ),
                    SizedBox(width: 16.w),
                    CustomText(
                      text: AppStrings.chooseAVenue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                // Description Text
                const CustomText(
                  text: AppStrings.provideTheNameOfTheTournamentVenue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16.h),

                // Dynamic Venue Fields
                DynamicTextFieldList(
                  fieldLabel: AppStrings.venue,
                  initialValues: [' '],
                  addAnotherLabel: AppStrings.addAnotherVenue,
                  minFields: 1,
                ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Checkbox(
                      value: isOnlineTournament,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setState(() {
                          isOnlineTournament = value!;
                        });
                      },
                    ),
                    const Expanded(
                      child: CustomText(
                        text: AppStrings.onlineESportsTournament,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
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
            // if (isOnlineTournament) {}
            Get.toNamed(AppRoutes.divisionsScreen);
          },

          cancelText: AppStrings.back,
        ),
      ),
    );
  }
}
