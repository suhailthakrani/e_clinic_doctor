import 'package:e_clinic_dr/ui/widgets/button1.dart';
import 'package:e_clinic_dr/ui/widgets/custom_drawer.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/ui/widgets/widget_svg.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/main_screen_controller.dart';

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
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
                      Text("Pending Payments",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Text("\$9600",
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
                      Text("Amount Required",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Text("\$9600",
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
                      Text("Total Amount",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Text("\$9600",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                )),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Button1(
                      textStyle: TextStyle(color: kWhiteColor),
                      buttonColor: kBlueColor,
                      text: 'Withdraw',
                      borderRadius: 12,
                      onPress: () {}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
