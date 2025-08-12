import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_screen_header/custom_screen_header.dart';

import '../../controller/drawer_controller.dart';
import 'teams_tab.dart';
import 'managers_tab.dart';

class ParticipantsScreen extends StatefulWidget {
  const ParticipantsScreen({super.key});

  @override
  State<ParticipantsScreen> createState() => _ParticipantsScreenState();
}

class _ParticipantsScreenState extends State<ParticipantsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DrawerControllerX drawerController = Get.find();

  @override
  void initState() {
    super.initState();
    // TabController length is correctly set to 2.
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
              // The tabs list contains only 2 tabs.
              tabs: const [
                Tab(text: AppStrings.teams),
                Tab(text: AppStrings.manager),
              ],
            ),
            Divider(color: AppColors.lightGray, height: 1.h, thickness: 1.w),
            SizedBox(height: 16.h),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                // The children list contains exactly 2 widgets.
                children: const [TeamsTab(), ManagersTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
