import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../components/custom_button/custom_button.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_text/custom_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = -1;

  final List<String> roles = [
    AppStrings.spectator,
    AppStrings.player,
    AppStrings.manager,
    AppStrings.administrator,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomText(
                text: AppStrings.welcomeToMasjidLeague,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
              SizedBox(height: 30.h),
              SizedBox(
                height: 200.h,
                child: CustomImage(imageSrc: AppImages.tournament1),
              ),
              SizedBox(height: 40.h),
              CustomText(
                text: AppStrings.joinAs,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),

              SizedBox(height: 20.h),

              /// Generate all buttons
              ...List.generate(roles.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CustomButton(
                    text: roles[index],
                    selected: _selectedIndex == index,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        Get.toNamed(AppRoutes.loginScreen);
                      });
                    },
                  ),
                );
              }),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
