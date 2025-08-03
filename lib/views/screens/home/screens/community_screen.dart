import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mojid/utils/app_const/app_const.dart';
import 'package:mojid/views/components/custom_network_image/custom_network_image.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: () {},
                        child: CustomText(
                          text: AppStrings.yes,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.secPrimary,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: () {},
                        child: CustomText(
                          text: AppStrings.no,
                          color: AppColors.secPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1),
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
                    Tab(text: "Overview"),
                    Tab(text: "Updates"),
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
          text: "Hosting Tournament",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 16.h),
        TournamentCard(),
        SizedBox(height: 16.h),
        CustomText(
          text: "Owned Team",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 16.h),
        TournamentCard(),
      ],
    );
  }

  Widget _buildUpdatesTab() {
    return ListView(
      padding: EdgeInsets.only(top: 16.h),
      children: [
        Container(
          height: 48.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secPrimary, width: 1.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: CustomText(
              text: "+ Post A New Update",
              color: AppColors.secPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomText(
          text: "Latest Updates",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12.h),
        _buildUpdateCard(),
      ],
    );
  }

  Widget _buildUpdateCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: CustomNetworkImage(
              imageUrl: AppConstants.footballLandscape,
              height: 150.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Iftar Party After Magrib",
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: "Iftar Party After Magrib at Alamin Masjid",
                  fontSize: 12,
                  color: Colors.grey.shade700,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 6.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomText(
                    text: "Yesterday",
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
