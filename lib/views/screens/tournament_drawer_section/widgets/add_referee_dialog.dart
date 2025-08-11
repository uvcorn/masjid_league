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
import 'add_player_dialog.dart';

class AddRefereeDialog extends StatefulWidget {
  const AddRefereeDialog({super.key});

  @override
  State<AddRefereeDialog> createState() => _AddRefereeDialogState();
}

class _AddRefereeDialogState extends State<AddRefereeDialog> {
  File? refereePhoto;
  final List<String> _referees = [];

  Widget _buildLabeledTextField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
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

  Widget ___refereesPill(String name, int index) {
    return Container(
      margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        // color: AppColors.secPrimary.withOpacity(.12),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(text: name, fontSize: 12, textAlign: TextAlign.left),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => setState(() => _referees.removeAt(index)),
            child: Icon(Icons.close, size: 14.r, color: AppColors.secPrimary),
          ),
        ],
      ),
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
                text: AppStrings.addReferee,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 24.h),

              _buildLabeledTextField(label: AppStrings.refereeName),

              /// Team Logo Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStrings.refereePhoto,
                    fontSize: 12,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      pickImage((file) {
                        setState(() {
                          refereePhoto = file;
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
              if (refereePhoto != null) ...[
                SizedBox(height: 8.h),
                ImagePreviewBox(
                  imageFile: refereePhoto!,
                  onRemove: () => setState(() => refereePhoto = null),
                ),
              ],
              SizedBox(height: 16.h),

              _buildLabeledTextField(label: AppStrings.email),

              /// Player pills
              if (_referees.isNotEmpty) ...[
                Wrap(
                  children: List.generate(
                    _referees.length,
                    (i) => ___refereesPill(_referees[i], i),
                  ),
                ),
                SizedBox(height: 16.h),
              ],

              /// Add Another Player
              SizedBox(
                height: 40.h,
                width: 160.w,
                child: InkWell(
                  onTap: () async {
                    final name = await showDialog<String>(
                      context: context,
                      builder: (_) => const AddPlayerDialog(),
                    );
                    if (name != null && name.trim().isNotEmpty) {
                      setState(() => _referees.add(name.trim()));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mediumGray),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: AppStrings.addAnotherReferee,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              /// QR Code
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
                    onPressed: () {},
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
