import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../custom_image/custom_image.dart';

class ReactionButton extends StatelessWidget {
  final String iconPath;
  final String count;
  final Color? color;
  final VoidCallback? onIconTap;
  final VoidCallback? onCountTap;

  const ReactionButton({
    super.key,
    required this.iconPath,
    required this.count,
    this.color,
    this.onIconTap,
    this.onCountTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        GestureDetector(
          onTap: onIconTap,
          child: CustomImage(
            imageSrc: iconPath,
            size: 24.r,
            imageColor: color ?? AppColors.mediumGray,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: onCountTap,
          child: Text(
            count,
            style: textTheme.labelSmall?.copyWith(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
