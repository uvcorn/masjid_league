import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../screens/home/screens/home_screen.dart';
import 'bottom_nav_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
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
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: Colors.transparent,
              backgroundColor: AppColors.white,
              shadowColor: AppColors.white,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
                states,
              ) {
                if (states.contains(WidgetState.selected)) {
                  return textTheme.labelMedium!.copyWith(
                    color: AppColors.primary,
                  );
                }
                return textTheme.labelMedium!.copyWith(
                  fontSize: 0,
                  color: Colors.transparent,
                );
              }),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
              ),
              child: SizedBox(
                height: 80,
                child: NavigationBar(
                  selectedIndex: navController.selectedIndex,
                  onDestinationSelected: navController.changeIndex,
                  destinations: [
                    NavigationDestination(
                      icon: Icon(
                        Icons.home,
                        color: navController.selectedIndex == 0
                            ? AppColors.primary
                            : AppColors.mediumGray,
                      ),
                      label: AppStrings.home,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.emoji_events,
                        color: navController.selectedIndex == 1
                            ? AppColors.primary
                            : AppColors.mediumGray,
                      ),

                      label: AppStrings.myTournament,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.star,
                        color: navController.selectedIndex == 2
                            ? AppColors.primary
                            : AppColors.mediumGray,
                      ),
                      label: AppStrings.favorites,
                    ),
                    NavigationDestination(
                      icon: Icon(
                        Icons.person,
                        color: navController.selectedIndex == 3
                            ? AppColors.primary
                            : AppColors.mediumGray,
                      ),
                      label: AppStrings.profile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
