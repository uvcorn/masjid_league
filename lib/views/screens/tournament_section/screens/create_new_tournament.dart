// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_date_picker/custom_date_picker.dart';
import '../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/custom_text/custom_text.dart';

class CreateNewTournament extends StatefulWidget {
  const CreateNewTournament({super.key});

  @override
  State<CreateNewTournament> createState() => _CreateNewTournamentState();
}

class _CreateNewTournamentState extends State<CreateNewTournament> {
  DateTime selectedDate = DateTime.now();
  String? selectedContactMethod;

  final titleController = TextEditingController();
  Future<void> _pickDate(BuildContext context) async {
    await showCustomDatePicker(
      context: context,
      initialDate: selectedDate,
      onDateSelected: (picked) {
        setState(() {
          selectedDate = picked;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 16.w),
                    CustomText(
                      text: AppStrings.newTournament,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                const CustomText(
                  text: AppStrings.allInformationCanBeChangedLater,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 48.h),
                CustomText(
                  text: AppStrings.addACoverPhotoForTheTournament,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mediumGray,
                ),
                SizedBox(height: 16.h),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CustomNetworkImage(
                        imageUrl: AppConstants.footballLandscape,
                        height: 190.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Container(
                      height: 64.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.white,
                            size: 32.r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                CustomText(
                  text: AppStrings.tournamentTitle,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: AppStrings.tournamentTitle,
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                ),

                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.tournamentLogo,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 20.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.mediumGray),
                        ),
                        child: Center(
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: AppStrings.chooseFile,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                CustomText(
                  textAlign: TextAlign.left,
                  text: AppStrings.masjidORCommunity,
                  fontWeight: FontWeight.w500,
                ),

                CustomDropdownMenu(
                  options: [AppStrings.community1, AppStrings.community2],
                  hint: AppStrings.selectMasjidORCommunity,
                  selectedValue: selectedContactMethod,
                  onSelected: (value) {
                    setState(() {
                      selectedContactMethod = value;
                    });
                  },
                ),

                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _pickDate(context),

                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: AppStrings.day1,
                            labelStyle: TextStyle(fontSize: 16.sp),
                          ),
                          child: Text(
                            DateFormat('MM-dd-yyyy').format(selectedDate),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 40.h,
                  width: 125.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.mediumGray),
                  ),
                  child: Center(
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: AppStrings.addAnotherDay,
                      fontSize: 14,
                    ),
                  ),
                ),

                SizedBox(height: 38.h),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.mediumGray,
                            width: 1.5,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: CustomText(
                          textAlign: TextAlign.left,
                          text: AppStrings.cancel,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: AppColors.secPrimary,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secPrimary,
                        ),
                        onPressed: () {},
                        child: CustomText(
                          textAlign: TextAlign.left,
                          text: AppStrings.next,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 48.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
