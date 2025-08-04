import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_checkbox/custom_checkbox.dart';
import '../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../components/custom_input_field/custom_input_field.dart';
import '../../../components/custom_text/custom_text.dart';

void showRegisterDialog(BuildContext context) {
  final List<String> sports = [
    "Basketball",
    "Cricket",
    "Football",
    "Volleyball",
  ];
  final Map<String, bool> initialSelectedSports = {
    for (var sport in sports) sport: false,
  };
  final textController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      String? selectedContactMethod;
      Map<String, bool> selectedSports = Map.from(initialSelectedSports);

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            contentPadding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: AppStrings.registerYourOrganization,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 20.h),

                  // TextField 1: Masjid/Youth Centre Name
                  SizedBox(
                    height: 44.h,
                    child: CustomInputField(
                      controller: textController,
                      hintText: AppStrings.masjidOrYouthCentreName,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Row with First Name and Last Name TextFields
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44.h,
                          child: CustomInputField(
                            controller: textController,
                            hintText: AppStrings.firstName,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: SizedBox(
                          height: 44.h,
                          child: CustomInputField(
                            controller: textController,
                            hintText: AppStrings.lastName,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  /// Custom Contact Method Selector
                  CustomDropdownMenu(
                    options: const [
                      AppStrings.email,
                      AppStrings.phoneOrSMS,
                      AppStrings.whatsApp,
                    ],
                    hint: AppStrings.selectMasjidORCommunity,
                    selectedValue: selectedContactMethod,
                    onSelected: (value) {
                      setState(() {
                        selectedContactMethod = value;
                      });
                    },
                  ),

                  SizedBox(height: 12.h),

                  // TextField 4: Position/Role within Organization
                  SizedBox(
                    height: 44.h,
                    child: CustomInputField(
                      controller: textController,
                      hintText: AppStrings.positionRoleWithinOrganization,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.imInterestedIn),
                      SizedBox(height: 8.h),
                      ...sports.map(
                        (sport) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: CustomCheckbox(
                            showCheckbox: true,
                            value: selectedSports[sport],
                            onChanged: (val) {
                              setState(() {
                                selectedSports[sport] = val ?? false;
                              });
                            },
                            leadingText: sport,
                            leadingTextStyle: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            clickableText: '',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  CustomInputField(
                    controller: textController,
                    hintText: AppStrings.anyQuestionOrRelevantInformation,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                  ),
                  SizedBox(height: 20.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showRegistrationSuccessDialog(context);
                      },
                      child: Text(
                        AppStrings.submit,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

void showRegistrationSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: AppStrings.registerYourOrganization,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              maxLines: 1,
            ),
            SizedBox(height: 24.h),
            CustomText(
              text: AppStrings.thanksForRegistration,
              fontSize: 12.sp,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomText(
                  text: AppStrings.done,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
