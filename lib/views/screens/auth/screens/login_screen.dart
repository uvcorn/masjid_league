import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojid/views/components/custom_text/custom_text.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text_field/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              /// Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(),
                  Row(
                    children: [
                      Text('AR', style: TextStyle(fontSize: 14.sp)),
                      SizedBox(width: 8.w),
                      Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secPrimary,
                        ),
                        child: Center(
                          child: Text(
                            'EN',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Center(
                child: CustomText(
                  text: "Welcome Back!\nLet's Sign In.",
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 36.h),

              /// Email
              Text('Email', style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 20.h),

              /// Password
              Text('Password', style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 8.h),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: obscurePassword,
                togglePassword: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),

              SizedBox(height: 10.h),

              /// Remember Me & Forgot
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (val) {
                      setState(() => rememberMe = val!);
                    },
                    activeColor: AppColors.secPrimary,
                  ),
                  Text('Remember me', style: TextStyle(fontSize: 14.sp)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.secPrimary,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              /// Sign In Button
              CustomButton(
                selected: true,
                text: 'Sign In',
                onTap: () {
                  // Handle login logic
                },
              ),

              SizedBox(height: 24.h),

              /// Sign Up Prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Sign Up
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: AppColors.secPrimary,
                      ),
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
