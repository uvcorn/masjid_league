import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';

class CustomPinCode extends StatefulWidget {
  const CustomPinCode({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CustomPinCode> createState() => _CustomPinCodeState();
}

class _CustomPinCodeState extends State<CustomPinCode> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PinCodeTextField(
            controller: widget.controller,
            length: 4,
            obscureText: false,
            animationType: AnimationType.fade,
            animationDuration: Duration(milliseconds: 300),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            enableActiveFill: true,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8.r),
              activeColor: Colors.grey.shade200,
              inactiveColor: Colors.grey.shade200,
              selectedColor: Colors.grey.shade200,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              selectedFillColor: Colors.white,
              fieldWidth: 70.w,
              fieldHeight: 60.w,
            ),
            appContext: context,
            onChanged: (value) {
              if (value.length == 4) {
                setState(() {
                  _errorMessage = null;
                });
              }
            },
            validator: (String? value) {
              if (value == null || value.length < 4) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    _errorMessage = AppStrings.enterYourFullOtp;
                  });
                });
                return null;
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _errorMessage = null;
                });
              });
              return null;
            },
          ),
          if (_errorMessage != null) ...[
            SizedBox(height: 2.h),
            Text(
              _errorMessage!,
              style: TextStyle(color: AppColors.red, fontSize: 14.sp),
            ),
          ],
        ],
      ),
    );
  }
}
