import 'package:e_clinic_dr/ui/widgets/button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_field_manager.dart';
import '../../../../utils/text_filter.dart';
import '../../../widgets/general_text_field.dart';

class PersonalInfoSettingsScreen extends StatelessWidget {
  const PersonalInfoSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  TextFieldManager firstNameController =
      TextFieldManager('First Name', length: 50, filter: TextFilter.name);
  TextFieldManager lastNameController =
      TextFieldManager('Last Name', length: 50, filter: TextFilter.name);
  TextFieldManager emailController =
      TextFieldManager('Email', length: 50, filter: TextFilter.email);
  TextFieldManager passwordController =
      TextFieldManager('Password', length: 50, filter: TextFilter.none);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          title: Text(
            'Personal Info Settings',
            style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: Get.height * 0.8,
              width: Get.width,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: const [
                    BoxShadow(color: kFieldShadowColor, offset: Offset(-1, -1)),
                    BoxShadow(color: kFieldShadowColor, offset: Offset(1, 1))
                  ]),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const Text(
                    'Personal information',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      child: Image.asset('assets/images/personal_info.png'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/images/upload.png',
                            height: 30,
                            width: 30,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kWhiteColor,
                            foregroundColor: kBlueColor,
                          ),
                          label: const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Change photo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF166FFF),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0.09,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Allowed JPG, GIF or PNG. Max size of 2MB',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.11,
                          ),
                        ),
                      ),
                       GeneralTextField.withBorder(
                    tfManager: firstNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  GeneralTextField.withBorder(
                    tfManager: lastNameController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                  // GeneralTextField.withBorder(
                  //   tfManager: cnicController,
                  //   paddingVertical: 0,
                  //   paddingHorizontal: 8,
                  // ),
                  GeneralTextField.withBorder(
                    tfManager: emailController,
                    paddingVertical: 0,
                    paddingHorizontal: 8,
                  ),
                
                      const SizedBox(height: 8),
                      Button2(text: 'Save Changes', onPress: (){},),
                      const SizedBox(height: 8),
                       Button2(text: 'Cancel', onPress: (){},)
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
