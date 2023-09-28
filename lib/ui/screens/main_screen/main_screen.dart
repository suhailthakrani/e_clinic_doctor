import 'package:e_clinic_dr/ui/widgets/button1.dart';
import 'package:e_clinic_dr/ui/widgets/custom_drawer.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/ui/widgets/general_button.dart';
import 'package:e_clinic_dr/ui/widgets/widget_svg.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/main_screen_controller.dart';
import '../../widgets/general_text_field.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Dashboard',
      // appBar: AppBar(),
      // endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding:  EdgeInsets.only(left: 16, right:16, top:16, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/card.png'),
                      const Text("Pending Payments",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      const Text("\$9600",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                )),
            Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/amount.png'),
                      const Text("Amount Required",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      const Text("\$9600",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                )),
            Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/total.png'),
                      const Text("Total Amount",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      const Text("\$9600",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                )),
            SizedBox(height: 16.h),
            Row(
              children: [
                SizedBox(
                  height:50,
                  width: Get.width * 0.6,
                  child: Button1(
                    textStyle: const TextStyle(color: kWhiteColor),
                    buttonColor: kBlueColor,
                    text: 'Withdraw Amount',
                    borderRadius: 12,
                    onPress: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Card(
              elevation: 8,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                           controller.changeEditMode(false);
                          },
                          child: Image.asset(
                            'assets/images/edit_icon.png',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      
                      SizedBox(height: 10.h),
                      Obx(()=> GeneralTextField.withBorder(
                          tfManager: controller.bankNameController,
                          paddingVertical: 0,
                          paddingHorizontal: 8,
                          readOnly: controller.disableEditAcountEdtals.value,
                        ),
                      ),
                      Obx(()=> GeneralTextField.withBorder(
                          tfManager: controller.branchNameController,
                          paddingVertical: 0,
                          paddingHorizontal: 8,
                          readOnly: controller.disableEditAcountEdtals.value,
                        ),
                      ),
                      Obx(()=> GeneralTextField.withBorder(
                          tfManager: controller.accountController,
                          paddingVertical: 0,
                          paddingHorizontal: 8,
                          readOnly: controller.disableEditAcountEdtals.value,
                        ),
                      ),
                      Obx(()=> GeneralTextField.withBorder(
                          tfManager: controller.accountHolderController,
                          paddingVertical: 0,
                          paddingHorizontal: 8,
                          readOnly: controller.disableEditAcountEdtals.value,
                        ),
                      ),
                       GeneralButton(
                          onPressed: () {
                            controller.changeEditMode(true);
                          },
                          text: 'Save Account Details',
                          color: kBlueColor,
                          margin: 0,
                          height: 50,
                          radius: 16,
                        ),                
                    ],
                  ),
                ),
              ),
            
            SizedBox(height: 100.h)
          ],
        ),
      ),
    );
  }
}
