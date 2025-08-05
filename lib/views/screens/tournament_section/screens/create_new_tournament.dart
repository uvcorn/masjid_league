// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/dynamic_date_field_list/dynamic_date_field_list.dart';
import '../../../components/image_preview_box/image_preview_box.dart';
import '../../../components/image_utils/image_utils.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class CreateNewTournament extends StatefulWidget {
  const CreateNewTournament({super.key});

  @override
  State<CreateNewTournament> createState() => _CreateNewTournamentState();
}

class _CreateNewTournamentState extends State<CreateNewTournament> {
  DateTime selectedDate = DateTime.now();
  String? selectedContactMethod;
  List<DateTime> selectedDates = [DateTime.now()];
  List<TextEditingController> dateControllers = [TextEditingController()];
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  File? _backgroundImageFile;
  File? _logoImageFile;

  @override
  void initState() {
    super.initState();
    dateControllers[0].text = DateFormat('dd-MM-yyyy').format(selectedDates[0]);
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
                CustomText(
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
                      child: _backgroundImageFile != null
                          ? Image.file(
                              _backgroundImageFile!,
                              height: 190.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : CustomNetworkImage(
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
                          onTap: () => pickImage((file) {
                            setState(() {
                              _backgroundImageFile = file;
                            });
                          }),
                          child: Icon(
                            Icons.camera_alt,
                            size: 32.r,
                            color: Colors.white,
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
                    labelStyle: TextStyle(fontSize: 14.sp),
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
                      onTap: () => pickImage((file) {
                        setState(() {
                          _logoImageFile = file;
                        });
                      }),
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
                if (_logoImageFile != null)
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: ImagePreviewBox(
                      imageFile: _logoImageFile!,
                      onRemove: () => setState(() => _logoImageFile = null),
                    ),
                  ),

                SizedBox(height: 32.h),
                CustomText(
                  textAlign: TextAlign.left,
                  text: AppStrings.masjidORCommunity,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 16.h),
                CustomDropdownMenu(
                  hint: AppStrings.selectMasjidORCommunity,
                  options: [AppStrings.community1, AppStrings.community2],
                  selectedValue: selectedContactMethod,
                  isUnderlineStyle: true,
                  isCircularBorderStyle: false,
                  onSelected: (val) =>
                      setState(() => selectedContactMethod = val),
                ),

                SizedBox(height: 12.h),

                DynamicDateFieldList(),

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
                          Get.back();
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
                        onPressed: () {
                          Get.back();
                          SnackbarHelper.show(
                            message: 'Tournament created, ready to go!',
                            backgroundColor: AppColors.primary,
                            textColor: AppColors.white,
                            isSuccess: true,
                          );
                        },
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
