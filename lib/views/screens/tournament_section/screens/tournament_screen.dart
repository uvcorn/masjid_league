// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widgets/tournament_date_info.dart';
import '../widgets/tournament_image_and_details.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              CustomAppBar(
                hintText: AppStrings.searchCommunity,
                notificationCount: 5,
                onNotificationTap: () {
                  // Handle tap
                },
              ),
              SizedBox(height: 20.h),
              CustomText(
                text: AppStrings.myTournament,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.oswaldFont,
                fontSize: 20.sp,
              ),
              SizedBox(height: 12.h),

              // Tournament Card
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.tournamentDrawerMainScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.1),
                        blurRadius: 4.r,
                        offset: Offset(0.r, 3.r),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      TournamentImageAndDetails(),
                      TournamentDateInfo(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.createNewTournament);
                },
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.secPrimary),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: AppStrings.createANewTournament,
                      color: AppColors.secPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
