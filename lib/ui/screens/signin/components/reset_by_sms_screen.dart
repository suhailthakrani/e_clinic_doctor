import 'package:e_clinic_dr/controllers/forgot_password_controller.dart';
import 'package:e_clinic_dr/ui/widgets/button1.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'sms_code_widget.dart';

class ResetBySmsScreen extends GetView<ForgotPasswordScreenController> {
  const ResetBySmsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: const Size(428, 926),
            builder: (context, widget) => Container(
              margin: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 0.w),
                      Text("Forgot Password", style: textTheme.headline1),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  const Text(
                    "Code has been sent on +11100****119",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 90.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SmsCodeWidget(),
                      SizedBox(width: 20.w),
                      const SmsCodeWidget(),
                      SizedBox(width: 20.w),
                      const SmsCodeWidget(),
                      SizedBox(width: 20.w),
                      const SmsCodeWidget(),
                    ],
                  ),
                  SizedBox(height: 90.h),
                  const Text(
                    "Resend in 55s",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(height: 300.h),
                  Container(
                    height: 51.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      // apply shadow to the container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                          // shadow on botom and right
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Button1(
                      textStyle: textTheme.button!,
                      buttonColor: button2Color,
                      text: "Verify",
                      borderRadius: 30,
                      onPress: () {
                        // Navigator.pushNamed(
                        //     context, CreateNewPassScreen.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
