import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/toggle_yes_no_button/toggle_yes_no_button.dart';
import '../widgets/tournament_card.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 16.w),
                  CustomText(
                    text: AppStrings.community,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: AppStrings.alaminMasjidCommunity,
                      fontFamily: AppStrings.oswaldFont,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: AppStrings.administrator,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secPrimary,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: AppStrings.userName,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secPrimary,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              CustomText(
                text: AppStrings.raiseDonation,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              ToggleYesNoButton(),
              SizedBox(height: 24.h),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1.w),
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.black,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                  tabs: const [
                    Tab(text: AppStrings.overview),
                    Tab(text: AppStrings.updates),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [_buildOverviewTab(), _buildUpdatesTab()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return ListView(
      padding: EdgeInsets.only(top: 16.h),
      children: [
        CustomText(
          text: AppStrings.hostingTournament,
          fontSize: 20,
          fontFamily: AppStrings.oswaldFont,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 16.h),
        TournamentCard(),
        SizedBox(height: 16.h),
        CustomText(
          text: AppStrings.ownedTeam,
          fontSize: 20,
          fontFamily: AppStrings.oswaldFont,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 16.h),
        TournamentCard(isOwnedTeam: true),
      ],
    );
  }

  Widget _buildUpdatesTab() {
    return ListView(
      padding: EdgeInsets.only(top: 16.h),
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.postUpdateScreen);
          },
          child: Container(
            height: 80.h,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.secPrimary, width: 1.5),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: CustomText(
                text: AppStrings.postANewUpdate,
                color: AppColors.secPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomText(
          text: AppStrings.latestUpdates,
          fontSize: 20,
          fontFamily: AppStrings.oswaldFont,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 16.h),
        _buildUpdateCard(),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildUpdateCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.secPrimary),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: CustomNetworkImage(
                imageUrl: AppConstants.footballLandscape,
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: AppStrings.iftarPartyAfterMagrib,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    CustomText(
                      text: AppStrings.yesterday,
                      fontSize: 12,
                      color: AppColors.mediumGray,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: AppStrings.iftarPartyAfterMagribAtAlaminMasjid,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mediumGray,
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 16.h),
                CustomText(
                  text: AppStrings.raiseDonation,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 8.h),
                ToggleYesNoButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
