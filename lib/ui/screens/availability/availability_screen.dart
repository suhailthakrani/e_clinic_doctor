import 'package:e_clinic_dr/ui/screens/availability/components/availability_card.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 20.h),
          Text(
            "Schedule Timings",
            style: TextStyle(fontSize: 28.w, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            "Schedule Your Availability",
            style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: GeneralTextField.withShadow(
                          tfManager: controller.timeSlotController),
                    ),
                    Flexible(
                      child: GeneralTextField.withShadow(
                          tfManager: controller.assignSessionController),
                    ),
                  ],
                ),
                Obx(() => Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (controller.availabilityList.isEmpty)
                            Text("List is Empty!"),
                          for (int index = 0;
                              index < controller.availabilityList.length;
                              index++)
                            SingleAvailabilityWidget(
                                controller.availabilityList[index].obs),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
