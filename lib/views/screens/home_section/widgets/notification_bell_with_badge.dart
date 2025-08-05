import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojid/utils/app_icons/app_icons.dart';
import 'package:mojid/views/components/custom_image/custom_image.dart';

class NotificationBellWithBadge extends StatelessWidget {
  final int notificationCount;
  final Color bellColor;
  final double bellSize;
  final Color badgeColor;
  final double badgeRadius;
  final double badgeOffsetDx;
  final double badgeOffsetDy;
  final VoidCallback? onTap;
  const NotificationBellWithBadge({
    super.key,
    this.notificationCount = 0,
    this.bellColor = Colors.brown,
    this.bellSize = 30.0,
    this.badgeColor = Colors.red,
    this.badgeRadius = 2.0,
    this.badgeOffsetDx = 10.0,
    this.badgeOffsetDy = -10.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: bellColor, width: 1.5),
            ),
            child: CustomImage(imageSrc: AppIcons.bell, fit: BoxFit.fill),
          ),

          if (notificationCount > 0)
            Positioned(
              right: badgeOffsetDx,
              top: badgeOffsetDy,
              child: Container(
                width: badgeRadius * 2,
                height: badgeRadius * 2,
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                  // border: Border.all(color: AppColors.white, width: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
