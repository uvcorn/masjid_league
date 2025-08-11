import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../widgets/add_referee_dialog.dart';

class RefereesTab extends StatefulWidget {
  const RefereesTab({super.key});

  @override
  State<RefereesTab> createState() => _RefereesTabState();
}

class _RefereesTabState extends State<RefereesTab> {
  String? selectedDivision;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160.w,
            child: CustomDropdownMenu(
              hint: AppStrings.selectDivision,
              options: const [
                AppStrings.division,
                AppStrings.division1,
                AppStrings.division2,
              ],
              selectedValue: selectedDivision,
              onSelected: (val) {
                setState(() {
                  selectedDivision = val;
                });
              },
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppIcons.tShirtYellow, size: 60.r),
                SizedBox(height: 16.h),
                CustomText(
                  text: AppStrings.andUseTheSchedulePage,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: AppStrings.refereesToMatches,
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 170.w,
                  child: CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => const AddRefereeDialog(),
                      );
                    },
                    text: AppStrings.addAReferee,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
