import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';

Future<String?> showLabeledItemDialog({
  required BuildContext context,
  required String title,
  String? initialValue,
}) {
  final controller = TextEditingController(text: initialValue ?? '');

  return showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        title: CustomText(
          textAlign: TextAlign.left,
          text: title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: AppStrings.enterName,
            hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.mediumGray),
            isDense: true,
          ),
        ),
        actions: [
          SizedBox(
            height: 40.h,
            width: 80.w,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: CustomText(
                text: AppStrings.cancel,
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
            width: 80.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: CustomText(
                text: AppStrings.add,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
