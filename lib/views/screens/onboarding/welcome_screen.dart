import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojid/views/components/custom_text/custom_text.dart';

import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../components/custom_image/custom_image.dart';

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

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool selected;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fillColor = const Color(0xFF7B5E2E);
    return SizedBox(
      height: 46.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? fillColor : Colors.white,
          side: BorderSide(color: fillColor, width: 1.2),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : fillColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
