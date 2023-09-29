import 'package:e_clinic_dr/ui/screens/payments/components/payment_method_card.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/ui/widgets/input_field.dart';
import 'package:e_clinic_dr/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/payments/payment_screen_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../widgets/button1.dart';
import '../../widgets/button2.dart';
import '../../widgets/general_button.dart';
import '../../widgets/general_text_field.dart';
import 'components/small_info_button.dart';

class PaymentsScreen extends GetView<PaymentsController> {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Manage Payment',
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              width: Get.width,
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/card.png'),
                      SizedBox(height: 8),
                      const Text("Total Balance",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          )),
                      SizedBox(height: 8),
                      const Text("\$9600",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/amount.png'),
                        SizedBox(height: 8),
                        const Text("Amount Requested",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(height: 8),
                        const Text("\$0.00",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ))
                      ],
                    ),
                  )),
            ),
            SizedBox(
              width: Get.width,
              child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/total.png'),
                        SizedBox(height: 8),
                        const Text("Pending Payments",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(height: 8),
                        const Text(
                          "\$9600",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: Get.width * 0.6,
                  child: Button1(
                    textStyle: const TextStyle(color: kWhiteColor),
                    buttonColor: kBlueColor,
                    text: 'Withdraw Amount',
                    borderRadius: 12,
                    onPress: () {
                      Get.toNamed(kRequestPaymentScreenRoute);
                    },
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
                      onTap: () {
                        controller.changeEditMode(false);
                      },
                      child: Image.asset(
                        'assets/images/edit_icon.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => GeneralTextField.withBorder(
                        tfManager: controller.bankNameController,
                        paddingVertical: 0,
                        paddingHorizontal: 8,
                        readOnly: controller.disableEditAcountEdtals.value,
                      ),
                    ),
                    Obx(
                      () => GeneralTextField.withBorder(
                        tfManager: controller.branchNameController,
                        paddingVertical: 0,
                        paddingHorizontal: 8,
                        readOnly: controller.disableEditAcountEdtals.value,
                      ),
                    ),
                    Obx(
                      () => GeneralTextField.withBorder(
                        tfManager: controller.accountController,
                        paddingVertical: 0,
                        paddingHorizontal: 8,
                        readOnly: controller.disableEditAcountEdtals.value,
                      ),
                    ),
                    Obx(
                      () => GeneralTextField.withBorder(
                        tfManager: controller.accountHolderController,
                        paddingVertical: 0,
                        paddingHorizontal: 8,
                        readOnly: controller.disableEditAcountEdtals.value,
                      ),
                    ),
                    GeneralButton(
                      onPressed: () {
                        // controller.changeEditMode(true);
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
          ],
        ),
      ),
    );
  }
}
