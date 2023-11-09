import 'package:android_intent_plus/android_intent.dart';
import 'package:e_clinic_dr/controllers/register_screen_controller.dart';
import 'package:e_clinic_dr/ui/widgets/general_text_field.dart';
import 'package:e_clinic_dr/ui/widgets/widget_svg.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/constants.dart';
import 'package:flutter/cupertino.dart';
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
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          centerTitle: true,
          title: WSvgWidget(
            imageUrl: 'assets/images/logo.svg',
            height: 120,
          ),
          // toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ScreenUtilInit(
            designSize: Size(Get.width, Get.height),
            builder: (context, widget) => Container(
              // margin: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Join As a Doctor",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: kTextColor,
                      ),
                    ),
                  ),
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
                            fontSize: 17,
                            color: Color.fromRGBO(87, 98, 182, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.firstNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.lastNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.cnicController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.emailController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  Text(
                    controller.passwordController.fieldName,
                    style: const TextStyle(
                        color: kBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  Obx(
                    () => Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        obscureText: controller.obscureText.value,
                        controller: controller.passwordController.controller,
                        focusNode: controller.passwordController.focusNode,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        decoration: InputDecoration(
                          fillColor: kWhiteColor,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none),
                          // prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
                          contentPadding: const EdgeInsets.only(
                              top: 10.0, left: 10, bottom: 10),
                          hintText: controller.passwordController.fieldName,
                          hintStyle: const TextStyle(
                              color: kTextHintColor, fontSize: 16),
                          suffixIcon: GestureDetector(
                            onTap: controller.onObscureText,
                            child: controller.obscureText.value
                                ? Icon(CupertinoIcons.eye_slash_fill,
                                    color: kPrimaryColor)
                                : Icon(CupertinoIcons.eye_fill,
                                    color: kPrimaryColor),
                          ),
                        ),
                        onChanged: (value) {
                          controller.passwordController.validate();
                        },
                      ),
                    ),
                  ),
                  _getErrorMessage(
                      errorMessage: controller.passwordController.errorMessage),
                  GeneralTextField.withShadow(
                    tfManager: controller.phoneNoController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  GeneralDropdown.withShadow(
                    controller: controller.specializationController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GeneralDropdown.withShadow(
                          controller: controller.genderDDController,
                          paddingHorizontal: 0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: GeneralDropdown.withShadow(
                          controller: controller.experienceDDController,
                          paddingHorizontal: 0,
                        ),
                      ),
                    ],
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.hospitalController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.stateController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.cityController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
                  ),
                  GeneralTextField.withShadow(
                    tfManager: controller.addressController,
                    paddingVertical: 0,
                    paddingHorizontal: 0,
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

  Widget _getErrorMessage({required RxString errorMessage}) {
    return Obx(
      () => Visibility(
          visible: errorMessage.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(left: 4, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  errorMessage.value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kRequiredRedColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void openOtherInterApp() async {
    AndroidIntent intent = const AndroidIntent(
      action: 'action_view',
      data: 'patientapp://open', // Replace with your custom scheme and action
    );
    if (intent.data != null) {
      await intent.launch();
    }
  }
}
