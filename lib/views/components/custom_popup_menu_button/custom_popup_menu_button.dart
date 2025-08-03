import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.onChanged,
    this.icons,
    required this.items,
    this.iconColor = AppColors.white,
  });

  final List<String> items;
  final ValueChanged<String> onChanged;
  final IconData? icons;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Icon(icons ?? Icons.arrow_forward_ios, color: iconColor),
      ),

      itemBuilder: (context) => List.generate(items.length, (index) {
        return PopupMenuItem(
          onTap: () => onChanged(items[index]),
          height: 32.h,
          padding: EdgeInsets.only(left: 16.w, right: 0),
          child: CustomText(
            text: items[index],
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        );
      }),
    );
  }
}
