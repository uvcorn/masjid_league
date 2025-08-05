import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_colors/app_colors.dart';

Future<void> showCustomDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required Function(DateTime) onDateSelected,
}) async {
  DateTime tempPickedDate = initialDate;

  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Theme(
              data: ThemeData(
                useMaterial3: false,
                colorScheme: ColorScheme.light(
                  primary: AppColors.primary,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                  surface: Colors.white,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('y').format(tempPickedDate),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          DateFormat('EEE, MMM d').format(tempPickedDate),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.zero,
                    child: CalendarDatePicker(
                      initialDate: tempPickedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      onDateChanged: (value) {
                        setState(() {
                          tempPickedDate = value;
                        });
                      },
                    ),
                  ),

                  // Buttons
                  Padding(
                    padding: EdgeInsets.only(right: 16.w, bottom: 12.h, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        SizedBox(width: 8.w),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            onDateSelected(tempPickedDate);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
