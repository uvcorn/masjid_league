import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_screen_header/custom_screen_header.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: CustomScreenHeader(
            title: AppStrings.scheduleScreen,
            rightIcon: Icons.menu,
            onRightIconTap: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ),
    );
  }
}
