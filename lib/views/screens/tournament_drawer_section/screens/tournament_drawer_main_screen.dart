import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_drawer/custom_drawer.dart';
import 'format_screen.dart';
import 'general_screen.dart';
import '../controller/drawer_controller.dart';
import 'participants_screens/participants_screen.dart';
import 'results_screen.dart';
import 'schedule_screen.dart';

class TournamentDrawerMainScreen extends StatefulWidget {
  const TournamentDrawerMainScreen({super.key});

  @override
  State<TournamentDrawerMainScreen> createState() =>
      _TournamentDrawerMainScreenState();
}

class _TournamentDrawerMainScreenState
    extends State<TournamentDrawerMainScreen> {
  bool switchDescription = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DrawerControllerX drawerController = Get.put(DrawerControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(
        title: AppStrings.tournamentMenu,
        onItemSelected: (index) {
          Get.back(); // Close the drawer
        },
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(() {
          return IndexedStack(
            index: drawerController.selectedIndex.value,
            children: [
              GeneralScreen(), // Index 0
              ParticipantsScreen(), // Index 1
              FormatScreen(), // Index 2
              ScheduleScreen(), // Index 3
              ResultsScreen(),
            ],
          );
        }),
      ),
    );
  }
}
