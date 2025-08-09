import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_image/custom_image.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_bottom_bar/custom_bottom_bar.dart';
import '../widgets/register_dialog.dart';

class RegisterCommunityScreen extends StatefulWidget {
  const RegisterCommunityScreen({super.key});

  @override
  State<RegisterCommunityScreen> createState() =>
      _RegisterCommunityScreenState();
}

class _RegisterCommunityScreenState extends State<RegisterCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ), // Outer screen padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 16.w),
                  CustomText(
                    text: AppStrings.registerCommunity,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 240.h,
                          width: double.infinity,
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
                                  child: CustomNetworkImage(
                                    imageUrl: AppConstants.footballLandscape,
                                    fit: BoxFit.cover,
                                    height: 220.h,
                                    width: 320.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textAlign: TextAlign.start,
                                text: AppStrings.joinTheMasjidSports
                                    .toUpperCase(),
                                fontSize: 24,
                                fontFamily: AppStrings.oswaldFont,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 20.h),
                              CustomText(
                                textAlign: TextAlign.start,
                                text: AppStrings.registerCommunityDescription1,

                                color: AppColors.mediumGray,
                              ),
                              SizedBox(height: 16.h),
                              CustomText(
                                textAlign: TextAlign.start,
                                text: AppStrings.teamSize,

                                color: AppColors.mediumGray,
                              ),
                              CustomText(
                                textAlign: TextAlign.start,
                                text: AppStrings.formatKnockout,

                                color: AppColors.mediumGray,
                              ),
                              SizedBox(height: 16.h),
                              CustomText(
                                textAlign: TextAlign.start,
                                text: AppStrings.registerCommunityDescription2,

                                color: AppColors.mediumGray,
                              ),
                              SizedBox(height: 16.h),
                              CustomText(
                                textAlign: TextAlign.start,
                                text: AppStrings.description3,

                                color: AppColors.mediumGray,
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        leftButton: BottomBarButton(
          label: AppStrings.back,
          onPressed: () {
            Get.back();
          },
        ),
        rightButton: BottomBarButton(
          label: AppStrings.register,
          onPressed: () {
            showRegisterDialog(context);
          },
          isPrimary: true,
        ),
      ),
    );
  }
}
