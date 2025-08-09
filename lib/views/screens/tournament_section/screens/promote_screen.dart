import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widgets/custom_stepper.dart';

class PromoteScreen extends StatefulWidget {
  const PromoteScreen({super.key});

  @override
  State<PromoteScreen> createState() => _PromoteScreenState();
}

class _PromoteScreenState extends State<PromoteScreen> {
  // Length to budget mapping
  final Map<int, String> budgetMap = {0: '20', 1: '50', 2: '100', 3: '200'};

  int selectedLengthIndex = 0;

  @override
  Widget build(BuildContext context) {
    String selectedBudget = budgetMap[selectedLengthIndex]!;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 16.w),
                  CustomText(
                    text: AppStrings.promote,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Center(
                child: CustomStepper(
                  currentStep: 1,
                  labels: ['Details', 'Payment', 'Confirm'],
                ),
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: AppStrings.uploadACoverPhoto,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16.h),
              Container(
                height: 120.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_outlined,
                      size: 40.r,
                      color: AppColors.mediumGray,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: AppStrings.upload,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mediumGray,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: AppStrings.youArePromotingYourTournament,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.mediumGray,
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: AppStrings.budget,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),
              Container(
                width: double.infinity,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.mediumGray),
                ),
                child: Center(
                  child: CustomText(
                    text: '\$$selectedBudget',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),

              SizedBox(height: 24.h),
              CustomText(
                text: AppStrings.length,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),

              /// Length Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLengthButton('7 Day', 0, true, false),
                  _buildLengthButton('14 Days', 1, false, false),
                  _buildLengthButton('1 Month', 2, false, false),
                  _buildLengthButton('Custom', 3, false, true),
                ],
              ),

              const Spacer(),

              /// Pay Button
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.paymentScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: CustomText(
                    text: AppStrings.payNow,
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
    );
  }

  Widget _buildLengthButton(
    String label,
    int index,
    bool isLeftRadius,
    bool isRightRadius,
  ) {
    bool isSelected = selectedLengthIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedLengthIndex = index;
          });
        },
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            border: Border.all(color: AppColors.mediumGray),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isLeftRadius ? 10.r : 0.r),
              topRight: Radius.circular(isRightRadius ? 10.r : 0.r),
              bottomLeft: Radius.circular(isLeftRadius ? 10.r : 0.r),
              bottomRight: Radius.circular(isRightRadius ? 10.r : 0.r),
            ),
          ),
          child: Center(
            child: CustomText(
              text: label,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
