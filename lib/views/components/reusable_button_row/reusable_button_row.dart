import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../custom_text/custom_text.dart';
import '../snackbar_helper/snackbar_helper.dart';

class ReusableButtonRow extends StatelessWidget {
  final String cancelText;
  final String nextText;
  final VoidCallback onCancelPressed;
  final VoidCallback onNextPressed;
  final String? successMessage;
  final bool isSuccess;

  final Color cancelButtonColor;
  final Color cancelTextColor;
  final Color nextButtonColor;
  final Color nextTextColor;

  const ReusableButtonRow({
    super.key,
    this.cancelText = AppStrings.cancel,
    this.nextText = AppStrings.next,
    required this.onCancelPressed,
    required this.onNextPressed,
    this.successMessage,
    this.isSuccess = true,

    // Default colors are set for the buttons
    this.cancelButtonColor = AppColors.white,
    this.cancelTextColor = AppColors.secPrimary,
    this.nextButtonColor = AppColors.secPrimary,
    this.nextTextColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: cancelTextColor, width: 1.5.w),
              backgroundColor: cancelButtonColor,
            ),
            onPressed: onCancelPressed,
            child: CustomText(
              textAlign: TextAlign.left,
              text: cancelText,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: cancelTextColor,
            ),
          ),
        ),
        SizedBox(width: 16.w),

        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: nextButtonColor),
            onPressed: () {
              onNextPressed();

              if (successMessage?.isNotEmpty ?? false) {
                SnackbarHelper.show(
                  message: successMessage!,
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  isSuccess: isSuccess,
                );
              }
            },
            child: CustomText(
              textAlign: TextAlign.left,
              text: nextText,
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: nextTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
