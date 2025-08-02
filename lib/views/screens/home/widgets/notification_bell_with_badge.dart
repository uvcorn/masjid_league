import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

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
    this.badgeRadius = 4.0,
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
            height: 32,
            width: 32,
            // padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: bellColor, width: 1.5),
            ),
            child: Icon(
              Icons.notifications_none,
              color: bellColor,
              size: bellSize,
            ),
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
                  border: Border.all(color: AppColors.white, width: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
