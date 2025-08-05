import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePreviewBox extends StatelessWidget {
  final File imageFile;
  final double width;
  final double height;
  final VoidCallback onRemove;

  const ImagePreviewBox({
    super.key,
    required this.imageFile,
    this.width = 100,
    this.height = 100,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.file(
            imageFile,
            width: width.w,
            height: height.h,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: onRemove,
          child: CircleAvatar(
            radius: 12.r,
            backgroundColor: Colors.black54,
            child: Icon(Icons.close, size: 14.r, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
