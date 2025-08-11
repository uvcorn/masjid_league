import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../widgets/add_administrators_dialog.dart';

class ManagersTab extends StatefulWidget {
  const ManagersTab({super.key});

  @override
  State<ManagersTab> createState() => _ManagersTabState();
}

class _ManagersTabState extends State<ManagersTab> {
  String? selectedDivision;
  final List<Map<String, String>> _administrators = [];

  void _addAdministrator(Map<String, String> admin) {
    setState(() {
      _administrators.add(admin);
    });
  }

  void _editAdministrator(int index) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (_) =>
          AddAdministratorsDialog(adminData: _administrators[index]),
    );
    if (result != null) {
      setState(() {
        _administrators[index] = result;
      });
    }
  }

  void _deleteAdministrator(int index) {
    setState(() {
      _administrators.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160.w,
            child: CustomDropdownMenu(
              hint: AppStrings.selectDivision,
              options: const [
                AppStrings.division,
                AppStrings.division1,
                AppStrings.division2,
              ],
              selectedValue: selectedDivision,
              onSelected: (val) {
                setState(() {
                  selectedDivision = val;
                });
              },
            ),
          ),
          SizedBox(height: 16.h),

          // Show administrators list or show empty message
          if (_administrators.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ListView.separated(
                itemCount: _administrators.length,
                separatorBuilder: (_, __) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Divider(color: AppColors.primary, thickness: 1),
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final admin = _administrators[index];
                  return Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Avatar with a default icon if no image is available
                        CircleAvatar(
                          radius: 32.r,
                          backgroundImage:
                              admin['photo'] != null &&
                                  admin['photo']!.isNotEmpty
                              ? FileImage(File(admin['photo']!))
                              : null, // No image when no photo is available
                          child:
                              admin['photo'] == null || admin['photo']!.isEmpty
                              ? Icon(
                                  Icons
                                      .person, // Default icon when no photo is available
                                  size: 32.r,
                                  color: AppColors.black, // Icon color
                                )
                              : null, // No icon if a photo exists
                        ),

                        SizedBox(width: 8.w),

                        // Name and subtitle
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: admin['name'] ?? '',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: admin['subtitle'] ?? '',
                              fontSize: 12,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        Spacer(),

                        // Edit button
                        IconButton(
                          icon: Icon(Icons.edit, size: 18.r),
                          onPressed: () =>
                              _editAdministrator(index), // Edit action
                        ),

                        // Delete button
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 18.r,
                            color: Colors.red,
                          ),
                          onPressed: () => _deleteAdministrator(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),
                  CustomImage(imageSrc: AppIcons.shirt, size: 60.r),
                  SizedBox(height: 16.h),
                  CustomText(text: AppStrings.adminCanHelpYou, fontSize: 16.sp),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: AppStrings.tournament,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

          SizedBox(height: 30.h),

          // Add Administrator button
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onTap: () async {
                final result = await showDialog<Map<String, String>>(
                  context: context,
                  builder: (_) => const AddAdministratorsDialog(),
                );
                if (result != null) {
                  _addAdministrator(result);
                }
              },
              text: AppStrings.addAnAdministrator,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
