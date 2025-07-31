import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller_binder.dart';
import 'core/app_routes/app_routes.dart';
import 'utils/app_theme/app_theme.dart';
import 'views/screens/splash_screen/splash_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: ControllerBinder(),
          theme: AppTheme.lightThemeData,
          home: SplashScreen(),
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
