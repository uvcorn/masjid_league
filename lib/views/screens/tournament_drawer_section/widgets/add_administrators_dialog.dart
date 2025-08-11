import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_checkbox/custom_checkbox.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/image_preview_box/image_preview_box.dart';
import '../../../components/image_utils/image_utils.dart';
import '../../../components/custom_network_image/custom_network_image.dart';

class AddAdministratorsDialog extends StatefulWidget {
  final Map<String, String>? adminData; // Accept data for editing

  const AddAdministratorsDialog({super.key, this.adminData});

  @override
  State<AddAdministratorsDialog> createState() =>
      _AddAdministratorsDialogState();
}

class _AddAdministratorsDialogState extends State<AddAdministratorsDialog> {
  File? administratorsPhoto;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // If editing, pre-fill the fields with the existing data
    if (widget.adminData != null) {
      _nameController.text = widget.adminData!['name'] ?? '';
      _emailController.text = widget.adminData!['subtitle'] ?? '';
      final photoPath = widget.adminData!['photo'];
      // Only create a File if the path is not null or empty
      if (photoPath != null && photoPath.isNotEmpty) {
        administratorsPhoto = File(photoPath);
      }
    }
  }

  Widget _buildLabeledTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
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
        SizedBox(height: 16.h),
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
                text: widget.adminData == null
                    ? AppStrings.addAdministrators
                    : AppStrings
                          .editAdministrators, // Change title based on edit
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16.h),

              _buildLabeledTextField(
                label: AppStrings.administratorsName,
                controller: _nameController,
              ),

              // Photo picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStrings.administratorsPhoto,
                    fontSize: 12,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      pickImage((file) {
                        setState(() {
                          administratorsPhoto = file;
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
              if (administratorsPhoto != null) ...[
                SizedBox(height: 8.h),
                ImagePreviewBox(
                  imageFile: administratorsPhoto!,
                  onRemove: () => setState(() => administratorsPhoto = null),
                ),
              ],
              SizedBox(height: 12.h),

              _buildLabeledTextField(
                label: AppStrings.email,
                controller: _emailController,
                textInputAction: TextInputAction.done,
              ),

              // Controls label and checkboxes
              CustomText(
                text: 'Controls',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 6.h),
              CustomCheckbox(
                leadingText: 'Manage General',
                clickableText: '',
                checkboxActiveColor: AppColors.primary,
              ),
              SizedBox(height: 6.h),
              CustomCheckbox(
                leadingText: 'Manage Participants',
                clickableText: '',
                checkboxActiveColor: AppColors.primary,
              ),
              SizedBox(height: 6.h),
              CustomCheckbox(
                leadingText: 'Manage Formats',
                clickableText: '',
                checkboxActiveColor: AppColors.primary,
              ),
              SizedBox(height: 6.h),
              CustomCheckbox(
                leadingText: 'Manage Schedule',
                clickableText: '',
                checkboxActiveColor: AppColors.primary,
              ),
              SizedBox(height: 6.h),
              CustomCheckbox(
                leadingText: 'Manage Results',
                clickableText: '',
                checkboxActiveColor: AppColors.primary,
              ),
              SizedBox(height: 12.h),

              // QR Code section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.qrLoginCode,
                    fontSize: 16,
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  CustomNetworkImage(imageUrl: AppConstants.qrCode, size: 64),
                ],
              ),
              SizedBox(height: 18.h),

              // Actions
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
                      // Return updated data
                      Navigator.pop(context, {
                        'name': _nameController.text.trim(),
                        'subtitle': _emailController.text.trim(),
                        'photo': administratorsPhoto?.path ?? '',
                      });
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
                      text: widget.adminData == null
                          ? AppStrings.add
                          : AppStrings.update,
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
