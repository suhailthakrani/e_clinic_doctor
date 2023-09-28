import 'package:e_clinic_dr/controllers/payments/payment_screen_controller.dart';
import 'package:e_clinic_dr/ui/widgets/button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/payments/request_payment_controller.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/button1.dart';
import '../../../widgets/general_dropdown.dart';
import '../../../widgets/general_text_field.dart';

class RequestPaymentScreen extends GetView<RequestPaymentController> {
  const RequestPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          'Check Your Email',
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              const Text(
                'Payment Request',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.06,
                  letterSpacing: -0.36,
                ),
              ),
              SizedBox(height: 30.h),
              GeneralTextField.withBorder(
                tfManager: controller.requestAmountController,
                paddingHorizontal: 8,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.descriptionController,
                paddingHorizontal: 8,
              ),
              GeneralDropdown.withBorder(
                controller: controller.accountNumberDDController,
                paddingHorizontal: 10,
              ),
               SizedBox(height: 30.h),
              Button2(text: 'Withdraw Amount', onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
