import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_screen_header/custom_screen_header.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../tournament_section/widgets/drawer_controller.dart';

class ParticipantsScreen extends StatefulWidget {
  const ParticipantsScreen({super.key});

  @override
  State<ParticipantsScreen> createState() => _ParticipantsScreenState();
}

class _ParticipantsScreenState extends State<ParticipantsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DrawerControllerX drawerController = Get.find();

  String? selectedDivision;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: CustomScreenHeader(
                title: AppStrings.aTestTournament,
                rightIcon: Icons.menu,
                onRightIconTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
            SizedBox(height: 16.h),

            Column(
              children: [
                TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.mediumGray,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: const [
                    Tab(text: AppStrings.teams),
                    Tab(text: AppStrings.referees),
                    Tab(text: AppStrings.manager),
                  ],
                ),
                Divider(color: AppColors.lightGray, height: 1.h, thickness: 1),
              ],
            ),
            SizedBox(height: 16.h),

            /// ➡️ Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTeamsTab(),
                  _buildRefereesTab(),
                  _buildManagerTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// -------------------------------------------------------------------------
  /// The Content for each Tab
  /// -------------------------------------------------------------------------

  Widget _buildTeamsTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),

          /// Dropdown for Division
          SizedBox(
            width: 160.w,
            child: CustomDropdownMenu(
              hint: AppStrings.selectDivision,
              options: const [
                AppStrings.division,
                AppStrings.division1,
                AppStrings.division2,
              ],
              selectedValue: selectedDivision,
              onSelected: (val) {
                setState(() {
                  selectedDivision = val;
                });
              },
            ),
          ),
          const Spacer(),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppIcons.tShirt, size: 60.r),
                SizedBox(height: 16.h),
                CustomText(text: AppStrings.noTeamsAddedYet, fontSize: 16.sp),
                SizedBox(height: 8.h),
                CustomText(
                  text: AppStrings.addTeamsToThisDivision,
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 170,
                  child: CustomButton(
                    onTap: () {
                      // Navigate to add team screen or show a dialog
                    },
                    text: AppStrings.addATeam,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildRefereesTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160.w,
            child: CustomDropdownMenu(
              hint: AppStrings.selectDivision,
              options: const [
                AppStrings.division,
                AppStrings.division1,
                AppStrings.division2,
              ],
              selectedValue: selectedDivision,
              onSelected: (val) {
                setState(() {
                  selectedDivision = val;
                });
              },
            ),
          ),
          const Spacer(),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppIcons.tShirtYellow, size: 60.r),
                SizedBox(height: 16.h),
                CustomText(
                  text: AppStrings.andUseTheSchedulePage,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: AppStrings.refereesToMatches,
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 170,
                  child: CustomButton(
                    onTap: () {
                      // Navigate to add team screen or show a dialog
                    },
                    text: AppStrings.addAReferee,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildManagerTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160.w,
            child: CustomDropdownMenu(
              hint: AppStrings.selectDivision,
              options: const [
                AppStrings.division,
                AppStrings.division1,
                AppStrings.division2,
              ],
              selectedValue: selectedDivision,
              onSelected: (val) {
                setState(() {
                  selectedDivision = val;
                });
              },
            ),
          ),
          const Spacer(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppIcons.shirt, size: 60.r),
                SizedBox(height: 16.h),
                CustomText(text: AppStrings.adminCanHelpYou, fontSize: 16.sp),
                SizedBox(height: 8.h),
                CustomText(
                  text: AppStrings.tournament,
                  fontSize: 16.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: 200,
                  child: CustomButton(
                    onTap: () {
                      // Navigate to add team screen or show a dialog
                    },
                    text: AppStrings.addAnAdministrator,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
