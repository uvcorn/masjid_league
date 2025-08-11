import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/image_preview_box/image_preview_box.dart';
import '../../../components/image_utils/image_utils.dart';
import '../../../components/custom_network_image/custom_network_image.dart';

class AddMultipleAdministratorsDialog extends StatefulWidget {
  const AddMultipleAdministratorsDialog({super.key});

  @override
  State<AddMultipleAdministratorsDialog> createState() =>
      _AddPlayerDialogState();
}

class _AddPlayerDialogState extends State<AddMultipleAdministratorsDialog> {
  File? playerPhoto;

  final _nameCtrl = TextEditingController();
  final _bioCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _managerCtrl = TextEditingController();
  final _managerContactCtrl = TextEditingController();

  Widget _buildLabeledTextField({
    required String label,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              color: AppColors.mediumGray,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      contentPadding: EdgeInsets.all(16.r),
      content: SizedBox(
        width: 360.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.addPlayer,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 24.h),

              _buildLabeledTextField(
                label: AppStrings.playerName,
                controller: _nameCtrl,
              ),

              /// Player photo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStrings.playerPhoto,
                    fontSize: 12,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      pickImage((file) {
                        setState(() {
                          playerPhoto = file;
                        });
                      });
                    },
                    child: Container(
                      height: 20.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mediumGray),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text: AppStrings.chooseFile,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              if (playerPhoto != null) ...[
                SizedBox(height: 8.h),
                ImagePreviewBox(
                  imageFile: playerPhoto!,
                  onRemove: () => setState(() => playerPhoto = null),
                ),
              ],
              SizedBox(height: 16.h),

              _buildLabeledTextField(
                label: AppStrings.bio,
                controller: _bioCtrl,
              ),
              _buildLabeledTextField(
                label: AppStrings.email,
                controller: _emailCtrl,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      label: AppStrings.teamManager,
                      controller: _managerCtrl,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildLabeledTextField(
                      label: AppStrings.managerContact,
                      controller: _managerContactCtrl,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              /// QR Login Code
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.qrLoginCode,
                    fontSize: 16,
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  CustomNetworkImage(imageUrl: AppConstants.qrCode, size: 64),
                ],
              ),
              SizedBox(height: 32.h),

              /// Actions
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CustomText(
                      text: AppStrings.cancel,
                      fontSize: 16,
                      color: AppColors.secPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 24.w),
                  ElevatedButton(
                    onPressed: () {
                      final name = _nameCtrl.text.trim();
                      Navigator.of(context).pop(name); // return value
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      minimumSize: Size(80.w, 40.h),
                    ),
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: AppStrings.add,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
