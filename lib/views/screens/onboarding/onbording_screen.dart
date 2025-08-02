// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_text/custom_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final titles = [AppStrings.title1, AppStrings.title2, AppStrings.title3];

  final descriptions = [
    AppStrings.description1,
    AppStrings.description2,
    AppStrings.description3,
  ];

  final images = [
    AppImages.footballMatch1,
    AppImages.footballMatch2,
    AppImages.footballMatch1,
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page?.round() != _currentPage) {
        setState(() {
          _currentPage = _controller.page!.round();
        });
      }
    });
  }

  // void _startAutoSlide() {
  //   if (_currentPage < 2) {
  //     Future.delayed(Duration(seconds: 2), () {
  //       if (!_isDisposed &&
  //           mounted &&
  //           _controller.hasClients &&
  //           _currentPage < 2) {
  //         _goToNextPage();
  //       }
  //     });
  //   }
  // }

  void _goToNextPage() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(AppRoutes.welcomeScreen);
    }
  }

  void _onNextPressed() {
    _goToNextPage();
  }

  Widget _buildIndicator(int index) {
    bool isActive = index == _currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 8.h,
      width: isActive ? 40.w : 8.w,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Page indicators
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(children: List.generate(3, _buildIndicator)),
            ),
            SizedBox(height: 60.h),
            // PageView (ONLY for images)
            SizedBox(
              height: 240.h,
              child: PageView.builder(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                onPageChanged: (int page) {},
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 240.h,
                          width: 330.w,
                          child: ClipRRect(
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: CustomImage(
                                    imageSrc: AppImages.cornerDecorationSvg,
                                  ),
                                ),
                                Positioned(
                                  top: 10.h,
                                  left: 10.w,
                                  child: CustomImage(
                                    imageSrc: images[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 30.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: titles[_currentPage],
                      textAlign: TextAlign.start,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      maxLines: 3,
                    ),

                    SizedBox(height: 20.h),
                    CustomText(
                      text: descriptions[_currentPage],
                      textAlign: TextAlign.start,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mediumGray,
                      maxLines: 10,
                    ),

                    Spacer(),
                    SizedBox(
                      height: 46.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secPrimary,
                        ),
                        onPressed: _onNextPressed,
                        child: Text(
                          _currentPage == 2
                              ? AppStrings.getStartedButton
                              : AppStrings.nextButton,
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
