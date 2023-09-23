import 'package:e_clinic_dr/controllers/register_screen_controller.dart';
import 'package:e_clinic_dr/ui/widgets/general_text_field.dart';
import 'package:e_clinic_dr/ui/widgets/widget_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_styles.dart';
import '../../widgets/button2.dart';
import '../../widgets/input_field.dart';
import '../../widgets/checkbox.dart';
import '../signin/login_screen.dart';

class SignUpScreen extends GetView<RegisterScreenController> {
  const SignUpScreen({Key? key}) : super(key: key);

  static const routeName = "signup_screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: Size(Get.width, Get.height),
            builder: (context, widget) => Container(
              margin: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WSvgWidget(
                        imageUrl: 'assets/images/logo.svg',
                        height: 50,
                      ),
                    ],
                  ),
                  Text("Join As a Doctor", style: textTheme.headline1),
                  Row(
                    children: [
                      Text("Already a member?",
                          style: textTheme.headlineMedium),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(87, 98, 182, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.firstNameController,
                    paddingVertical: 0,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.lastNameController,
                    paddingVertical: 0,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.emailController,
                    paddingVertical: 0,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.passwordController,
                    paddingVertical: 0,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.phoneNoController,
                    paddingVertical: 0,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.cityController,
                    paddingVertical: 0,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.stateController,
                    paddingVertical: 0,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: controller.addressController,
                    paddingVertical: 0,
                  ),
                  SizedBox(
                    // margin: EdgeInsets.only(right: 16.w, left: 20.w),
                    // color: Colors.red,
                    height: 34.h,
                    width: Get.width,
                    child: const CheckBoxWidget(
                      text:
                          "I agree to receive Email and SMS that may contain personal health information.",
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: Get.width,
                    child: Button2(
                        text: "SignUp",
                        onPress: () {
                          // Navigator.of(context).pushReplacementNamed(
                          //     CreateProfileScreen.routeName);
                        }),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
