// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_drawer/custom_drawer.dart';
import '../../../components/custom_switch/custom_switch.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widgets/invite_team_dialog.dart';
import '../widgets/multi_day_selector.dart';
import '../widgets/multi_labeled_item_selector.dart';
import '../widgets/tournament_image_and_details.dart';

class TournamentDetailsScreen extends StatefulWidget {
  const TournamentDetailsScreen({super.key});

  @override
  State<TournamentDetailsScreen> createState() =>
      _TournamentDetailsScreenState();
}

class _TournamentDetailsScreenState extends State<TournamentDetailsScreen> {
  bool switchDescription = false;
  int selectedIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<DrawerMenuItem> menuItems = [
    DrawerMenuItem(icon: Icons.settings, label: AppStrings.general),
    DrawerMenuItem(icon: Icons.groups, label: AppStrings.participants),
    DrawerMenuItem(imagePath: AppIcons.formate, label: AppStrings.format),
    DrawerMenuItem(icon: Icons.calendar_month, label: AppStrings.schedule),
    DrawerMenuItem(icon: Icons.emoji_events, label: AppStrings.results),
  ];
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(
        title: AppStrings.tournamentMenu,
        selectedIndex: selectedIndex,
        items: menuItems,
        onItemSelected: (index) {
          setState(() => selectedIndex = index);
          // Navigator.pop(context); // close the drawer
        },
      ),

      backgroundColor: AppColors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back, color: AppColors.black),
                  ),
                  SizedBox(width: 16.w),
                  CustomText(
                    text: AppStrings.aTestTournament,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => _scaffoldKey.currentState?.openEndDrawer(),

                    child: Icon(Icons.menu, color: AppColors.secPrimary),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              TournamentImageAndDetails(),

              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.promoteScreen);
                },
                child: Container(
                  width: double.infinity,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12.r),
                    ),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: AppStrings.promoteThisTournament,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      // color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              /// 📝 Tournament Title
              const CustomText(
                text: AppStrings.tournamentTitle,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              // SizedBox(height: 8.h),
              TextField(
                controller: titleController,
                decoration: InputDecoration(),
              ),
              SizedBox(height: 24.h),

              /// 📅 Match Days (use dynamic date field)
              const CustomText(
                text: AppStrings.matchDays,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8.h),
              MultiDaySelector(),

              SizedBox(height: 24.h),

              /// 📍 Venue (use dynamic text field)
              const CustomText(
                text: AppStrings.venue,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8.h),
              MultiLabeledItemSelector(
                label: AppStrings.venue,
                initialText: AppStrings.dhaka,
              ),

              SizedBox(height: 24.h),

              /// 🏆 Divisions (use dynamic text field)
              const CustomText(
                text: AppStrings.divisions,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8.h),
              MultiLabeledItemSelector(
                label: AppStrings.division,
                initialText: AppStrings.men,
              ),

              SizedBox(height: 12.h),

              /// 👥 Teams Section
              const CustomText(
                text: AppStrings.teams,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  final teamNameController = TextEditingController();
                  final emailController = TextEditingController();

                  showDialog(
                    context: context,
                    builder: (context) => InviteTeamDialog(
                      teamNameController: teamNameController,
                      emailController: emailController,
                      onInvite: () {
                        // handle invite logic
                        Navigator.pop(context);
                      },
                      onCancel: () => Navigator.pop(context),
                    ),
                  );
                },
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mediumGray),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Center(
                    child: CustomText(
                      text: AppStrings.inviteATeamToThisTournament,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 32.h),

              /// 🧮 Group Ranking
              const CustomText(
                text: AppStrings.groupRanking,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 4.h),

              CustomText(
                text: AppStrings.groupRankingDescription,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: AppStrings.points,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 12.h),
              _buildPointsField(AppStrings.forAWin),
              _buildPointsField(AppStrings.forADraw),
              _buildPointsField(AppStrings.forALoss),

              SizedBox(height: 10.h),
              _buildSwitchTile(
                title: AppStrings.switchDescription,
                value: switchDescription,
                onChanged: (val) {
                  setState(() {
                    switchDescription = val;
                  });
                },
              ),

              SizedBox(height: 24.h),

              const CustomText(
                text: AppStrings.points,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: AppStrings.pointsDescription,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  _buildTieBreaker(AppStrings.numberOfPoints),
                  SizedBox(width: 16.w),
                  _buildTieBreaker(AppStrings.numberOfPoints),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  _buildTieBreaker(AppStrings.numberOfPoints),
                  SizedBox(width: 16.w),
                  _buildTieBreaker(AppStrings.numberOfPoints),
                ],
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    // String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 24.h,
              width: 40.w,
              child: CustomSwitch(value: value, onChanged: onChanged),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomText(
                overflow: TextOverflow.clip,
                maxLines: null,
                fontSize: 14,
                text: title,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPointsField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.mediumGray,
          textAlign: TextAlign.left,
        ),
        TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildTieBreaker(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            height: 24.h,
            width: 132.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(2.r),
            ),
            child: Center(
              child: CustomText(
                text: label,
                color: AppColors.white,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.r,
            color: AppColors.secPrimary,
          ),
        ],
      ),
    );
  }
}
