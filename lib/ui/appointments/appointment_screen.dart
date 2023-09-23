import 'package:e_clinic_dr/ui/appointments/components/appointment_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/appointments/appointments_screen_cntroller.dart';
import 'appointments_list.dart';

class AppointmentsScreen extends GetView<AppointmentsController> {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: ScreenUtilInit(
            designSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            builder: (context, w) => Center(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i < controller.appointmentTypeList.length;
                          i++)
                        AppointmentType(
                            title: controller.appointmentTypeList[i].title,
                            selected:
                                controller.appointmentTypeList[i].selected,
                            onTap: () {
                              controller.selectAppointmentType(i);
                            })
                    ],
                  ),
                  SizedBox(height: 25.h),
                  if (controller.appointmentTypeList[0].selected)
                    ...upComingAppointments
                  else
                    ...previousAppointments
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
