import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../custom_text/custom_text.dart';
import '../snackbar_helper/snackbar_helper.dart';
import '../custom_date_picker/custom_date_picker.dart';

class DynamicDateFieldList extends StatefulWidget {
  final List<DateTime> initialDates;

  const DynamicDateFieldList({super.key, this.initialDates = const [ ],
  });

  @override
  State<DynamicDateFieldList> createState() => _DynamicDateFieldListState();
}

class _DynamicDateFieldListState extends State<DynamicDateFieldList> {
  late List<DateTime> selectedDates;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    selectedDates = widget.initialDates.isNotEmpty
        ? [...widget.initialDates]
        : [DateTime.now()];
    controllers = selectedDates
        .map(
          (date) => TextEditingController(
            text: DateFormat('dd-MM-yyyy').format(date),
          ),
        )
        .toList();
  }

  void _pickDate(int index) async {
    await showCustomDatePicker(
      context: context,
      initialDate: selectedDates[index],
      onDateSelected: (picked) {
        setState(() {
          selectedDates[index] = picked;
          controllers[index].text = DateFormat('dd-MM-yyyy').format(picked);
        });
      },
    );
  }

  void _addAnotherDay() {
    setState(() {
      final now = DateTime.now();
      selectedDates.add(now);
      controllers.add(
        TextEditingController(text: DateFormat('dd-MM-yyyy').format(now)),
      );
    });
  }

  void _removeDate(int index) {
    if (selectedDates.length <= 1) {
      SnackbarHelper.show(
        message: 'Keep at least one scheduled day.',
        backgroundColor: AppColors.primary,
        textColor: AppColors.white,
        isSuccess: false,
      );
      return;
    }
    setState(() {
      selectedDates.removeAt(index);
      controllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(selectedDates.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textAlign: TextAlign.left,
                  text: '${AppStrings.day} ${index + 1}',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
                TextFormField(
                  controller: controllers[index],
                  readOnly: true,
                  onTap: () => _pickDate(index),
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () => _removeDate(index),
                      child: Icon(
                        Icons.delete,
                        size: 24.r,
                        color: AppColors.black,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(0.w, 12.h, 0.w, 8.h),
                    isDense: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.black, width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.black,
                        width: 1.5.w,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        }),

        // Add another day button
        GestureDetector(
          onTap: _addAnotherDay,
          child: Container(
            height: 40.h,
            width: 125.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.mediumGray),
            ),
            child: Center(
              child: CustomText(
                textAlign: TextAlign.center,
                text: AppStrings.addAnotherDay,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
