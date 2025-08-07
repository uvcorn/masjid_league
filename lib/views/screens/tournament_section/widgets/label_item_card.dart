// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_text/custom_text.dart';

class LabeledItemCard extends StatelessWidget {
  final int index;
  final String text;
  final VoidCallback onEdit;
  final VoidCallback? onDelete;

  const LabeledItemCard({
    super.key,
    required this.index,
    required this.text,
    required this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            /// Index Badge
            Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4.r),
              ),
              alignment: Alignment.center,
              child: CustomText(
                text: '${index + 1}',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            SizedBox(width: 12.w),

            /// Text Value
            Expanded(
              child: CustomText(
                text: text,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
            ),

            /// Edit
            GestureDetector(
              onTap: onEdit,
              child: Icon(Icons.edit, size: 20.r, color: AppColors.black),
            ),

            if (onDelete != null) ...[
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: onDelete,
                child: Icon(Icons.delete, size: 20.r, color: AppColors.black),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
