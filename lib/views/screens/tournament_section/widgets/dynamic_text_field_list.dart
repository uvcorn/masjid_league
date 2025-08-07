import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/snackbar_helper/snackbar_helper.dart';

class DynamicTextFieldList extends StatefulWidget {
  final String fieldLabel;
  final List<String> initialValues;
  final int minFields;
  final String addAnotherLabel;

  const DynamicTextFieldList({
    super.key,
    required this.fieldLabel,
    this.initialValues = const [],
    this.minFields = 1,
    required this.addAnotherLabel,
  });

  @override
  State<DynamicTextFieldList> createState() => _DynamicTextFieldListState();
}

class _DynamicTextFieldListState extends State<DynamicTextFieldList> {
  late List<String> values;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    values = widget.initialValues.isNotEmpty ? [...widget.initialValues] : [''];
    controllers = values.map((v) => TextEditingController(text: v)).toList();
  }

  void _addField() {
    setState(() {
      values.add('');
      controllers.add(TextEditingController());
    });
  }

  void _removeField(int index) {
    if (values.length <= widget.minFields) {
      SnackbarHelper.show(
        message:
            'Keep at least ${widget.minFields} ${widget.fieldLabel.toLowerCase()}${widget.minFields > 1 ? 's' : ''}.',
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        isSuccess: false,
      );
      return;
    }
    setState(() {
      values.removeAt(index);
      controllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(values.length, (index) {
          String label = values.length == 1
              ? widget.fieldLabel
              : '${widget.fieldLabel} ${index + 1}';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                textAlign: TextAlign.left,
                text: label,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: AppColors.mediumGray,
              ),
              TextField(
                controller: controllers[index],
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () => _removeField(index),
                    child: Icon(
                      Icons.delete,
                      size: 24.r,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),

        SizedBox(height: 32.h),
        GestureDetector(
          onTap: _addField,
          child: Container(
            height: 40.h,
            width: 170.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.mediumGray),
            ),
            child: Center(
              child: CustomText(
                textAlign: TextAlign.center,
                text: widget.addAnotherLabel,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
