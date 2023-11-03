import 'package:e_clinic_dr/ui/screens/availability/components/availability_card.dart';
import 'package:e_clinic_dr/ui/widgets/button2.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/ui/widgets/general_dropdown.dart';
import 'package:e_clinic_dr/ui/widgets/general_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/availability_screen_controller.dart';

class AvailabilityScreen extends GetView<AvailabilityController> {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Schedule Timings',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 20.h),
            Text(
              "Schedule Timings",
              style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Schedule Your Availability",
              style: TextStyle(
                  fontSize: 15.w,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
            SizedBox(height: 10.h),
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    // Flexible(
                    //   child: GeneralTextField.withShadow(
                    //       tfManager: controller.timeSlotController),
                    // ),
                    Flexible(
                      child: GeneralDropdown.withShadow(
                        controller: controller.timeSlotDDController,
                        hint: '30 Min',
                      ),
                    ),
                    SizedBox(width: 10.h),
                    Flexible(
                      child: GeneralTextField.withShadow(
                        tfManager: controller.assignSessionController,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (controller.availabilityList.isEmpty)
                        const Text("List is Empty!"),
                      for (int index = 0;
                          index < controller.availabilityList.length;
                          index++)
                        SingleAvailabilityWidget(
                          index: index,
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Button2(
                      text: "Save Changes",
                      onPress: () {
                        controller.submitAvailability();
                      }),
                ),
                SizedBox(height: 60.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
