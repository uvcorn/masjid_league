// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_screen_header/custom_screen_header.dart';
import '../../../components/custom_switch/custom_switch.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../tournament_section/widgets/invite_team_dialog.dart';
import '../../tournament_section/widgets/multi_day_selector.dart';
import '../../tournament_section/widgets/multi_labeled_item_selector.dart';
import '../../tournament_section/widgets/tournament_image_and_details.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  bool switchDescription = false;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomScreenHeader(
            title: AppStrings.aTestTournament,
            rightIcon: Icons.menu,
            onRightIconTap: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
          SizedBox(height: 16.h),
          const TournamentImageAndDetails(),

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
          TextField(
            controller: titleController,
            decoration: const InputDecoration(),
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
          const MultiLabeledItemSelector(
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
          const MultiLabeledItemSelector(
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

          const CustomText(
            text: AppStrings.groupRankingDescription,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 12.h),
          const CustomText(
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

          CustomText(
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
    );
  }

  Widget _buildSwitchTile({
    required String title,
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
        const TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 14),
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
