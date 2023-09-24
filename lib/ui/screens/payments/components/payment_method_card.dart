import 'package:e_clinic_dr/controllers/payments/payment_screen_controller.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class PaymentMethodCard extends GetView<PaymentsController> {
  PaymentMethodCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.index,
  }) : super(key: key);
  final int index;
  final String text;
  final IconData icon;
  bool selected;
  @override
  Widget build(BuildContext context) {
    // final paymentMethodProvider = Provider.of<PaymentMethodProvider>(context);
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => InkWell(
        onTap: (){
          controller.selectPaymentMethod(
            index
          );
        },
        child: AnimatedOpacity(
          opacity: selected ? 1.0 : 0.7,
          duration: const Duration(milliseconds: 350),
          child: Material(
            borderRadius: BorderRadius.circular(16.w),
            elevation: selected ? 10 : 0,
            child: Container(
              height: 70.h,
              width: 160.w,
              decoration: BoxDecoration(
                color: selected ? kPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: selected ? Colors.white : Colors.black,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    text,
                    style: TextStyle(
                      color: selected ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
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
