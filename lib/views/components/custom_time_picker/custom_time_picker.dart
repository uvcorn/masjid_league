import 'package:flutter/material.dart';

class CustomTimePicker {
  static Future<TimeOfDay?> show({
    required BuildContext context,
    required TimeOfDay initialTime,
    required Color primaryColor,
    required Color lightGray,
  }) async {
    return await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,

              // Hour & Minute selected field style
              hourMinuteTextStyle: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
              hourMinuteColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return primaryColor;
                }
                return lightGray; // Unselected background
              }),

              // AM / PM buttons
              dayPeriodColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return primaryColor;
                }
                return Colors.grey.shade200;
              }),
              dayPeriodTextStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
              dayPeriodShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              dayPeriodBorderSide: BorderSide.none,

              // Dial styles
              dialTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              dialHandColor: primaryColor,
              dialBackgroundColor: Colors.grey.shade100,
              entryModeIconColor: primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: primaryColor,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
