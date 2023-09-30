import 'package:e_clinic_dr/controllers/register_screen_controller.dart';
import 'package:e_clinic_dr/ui/widgets/general_text_field.dart';
import 'package:e_clinic_dr/ui/widgets/widget_svg.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_styles.dart';
import '../../widgets/button2.dart';
import '../../widgets/general_dropdown.dart';
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
          padding: const EdgeInsets.all(16),
          child: ScreenUtilInit(
            designSize: Size(Get.width, Get.height),
            builder: (context, widget) => Container(
              // margin: EdgeInsets.all(8.w),
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
                          Get.toNamed(kLoginScreenRoute);
                          // Navigator.of(context)
                          //     .pushReplacementNamed(LoginScreen.routeName);
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
                  GeneralTextField.withShadow(
                    tfManager: controller.firstNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.lastNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.cnicController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.emailController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.passwordController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.phoneNoController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralDropdown.withShadow(
                    controller: controller.specializationController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GeneralDropdown.withShadow(
                              controller: controller.genderDDController),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: GeneralDropdown.withShadow(
                              controller: controller.experienceDDController),
                        ),
                      ],
                    ),
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.hospitalController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.stateController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.cityController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.addressController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Selecte Degree File',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Obx(
                          () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: kWhiteColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 2,
                                    color: controller
                                            .degreeDocument.value.isNotEmpty
                                        ? kGreenNormalColor
                                        : kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              await controller.pickImage();
                            },
                            child: Text(
                              'Browse',
                              style: TextStyle(
                                color:
                                    controller.degreeDocument.value.isNotEmpty
                                        ? kGreenNormalColor
                                        : kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => Text(
                          controller.degreeDocument.value.isNotEmpty
                              ? controller.degreeDocument.value.split('/').last
                              : '',
                          style: const TextStyle(
                              color: kBlack90Color,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
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
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: Get.width,
                    child: Button2(
                        text: "SignUp",
                        onPress: () {
                          controller.onRegisterClicked();
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
