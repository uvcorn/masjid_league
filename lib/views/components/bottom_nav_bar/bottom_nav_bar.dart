// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../screens/home_section/screens/home_screen.dart';
import '../../screens/tournament_section/screens/tournament_screen.dart';
import 'bottom_nav_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = [
    HomeScreen(),
    TournamentScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<BottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.selectedIndex],
          bottomNavigationBar: Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(
                    0.1,
                  ), // Softer shadow color
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60.r),
                topRight: Radius.circular(60.r),
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: Colors.transparent,
                  backgroundColor: AppColors.white,
                  shadowColor: Colors.transparent,
                  labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                    states,
                  ) {
                    if (states.contains(WidgetState.selected)) {
                      return textTheme.labelMedium!.copyWith(
                        color: AppColors.primary,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      );
                    }
                    return textTheme.labelMedium!.copyWith(
                      color: Colors.transparent,
                      fontSize: 0.sp,
                    );
                  }),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: NavigationBar(
                    selectedIndex: navController.selectedIndex,
                    onDestinationSelected: navController.changeIndex,
                    height: 70.h,
                    destinations: [
                      NavigationDestination(
                        icon: Icon(
                          Icons.home,
                          color: navController.selectedIndex == 0
                              ? AppColors.primary
                              : AppColors.mediumGray,
                          size: 24.r,
                        ),
                        label: AppStrings.home,
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.emoji_events,
                          color: navController.selectedIndex == 1
                              ? AppColors.primary
                              : AppColors.mediumGray,
                          size: 24.r,
                        ),
                        label: AppStrings.myTournament,
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.star,
                          color: navController.selectedIndex == 2
                              ? AppColors.primary
                              : AppColors.mediumGray,
                          size: 24.r,
                        ),
                        label: AppStrings.favorites,
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.person,
                          color: navController.selectedIndex == 3
                              ? AppColors.primary
                              : AppColors.mediumGray,
                          size: 24.r,
                        ),
                        label: AppStrings.profile,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
