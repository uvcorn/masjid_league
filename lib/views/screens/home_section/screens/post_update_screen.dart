// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_time_picker/custom_time_picker.dart';

class PostUpdateScreen extends StatefulWidget {
  const PostUpdateScreen({super.key});

  @override
  _PostUpdateScreenState createState() => _PostUpdateScreenState();
}

class _PostUpdateScreenState extends State<PostUpdateScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await CustomTimePicker.show(
      context: context,
      initialTime: selectedTime,
      primaryColor: AppColors.primary,
      lightGray: AppColors.lightGray,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 16.w),
                  CustomText(
                    text: AppStrings.postANewUpdateTop,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: AppStrings.uploadACoverForTheUpdate,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  GestureDetector(
                    onTap: () {
                      // Handle image upload
                    },
                    child: Container(
                      height: 120.h,
                      color: AppColors.mediumGray,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: AppColors.white,
                              size: 32.r,
                            ),
                            CustomText(
                              text: AppStrings.upload,
                              fontSize: 12,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomText(
                    text: AppStrings.titleUpdate,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),

                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: AppStrings.titleUpdate,
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomText(
                    text: AppStrings.details,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  TextField(
                    controller: detailsController,
                    decoration: InputDecoration(
                      labelText: AppStrings.details,
                      labelStyle: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomText(
                    text: AppStrings.scheduledTime,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: _pickTime,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 16.w,
                        horizontal: 12.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mediumGray),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(_formatTime(selectedTime)),
                    ),
                  ),
                  SizedBox(height: 64.h),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secPrimary,
                      minimumSize: Size(double.infinity, 50.h),
                    ),
                    child: CustomText(
                      text: AppStrings.postNow,
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
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
