import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomDropdownMenu extends StatelessWidget {
  final String? selectedValue;
  final List<String> options;
  final String hint;
  final ValueChanged<String> onSelected;

  const CustomDropdownMenu({
    super.key,
    required this.options,
    required this.hint,
    required this.onSelected,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      position: PopupMenuPosition.under,
      offset: const Offset(1, 0),
      itemBuilder: (BuildContext context) => options
          .map(
            (option) =>
                PopupMenuItem<String>(value: option, child: Text(option)),
          )
          .toList(),
      color: AppColors.white,
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumGray),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: selectedValue ?? hint,
              fontSize: 14.sp,
              color: selectedValue != null
                  ? AppColors.black
                  : AppColors.mediumGray,
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
