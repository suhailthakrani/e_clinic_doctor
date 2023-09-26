import 'package:e_clinic_dr/ui/screens/appointments/components/appointment_type_widget.dart';
import 'package:e_clinic_dr/ui/widgets/button1.dart';
import 'package:e_clinic_dr/ui/widgets/button2.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/appointments/appointments_screen_cntroller.dart';
import '../../widgets/general_date_picker_field.dart';
import 'appointments_list.dart';

class AppointmentsScreen extends GetView<AppointmentsController> {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Appointments',
      body: ScreenUtilInit(
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
        builder: (context, w) => Center(
          child: Obx(() => CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: kWhiteColor,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 10,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(50),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0;
                                i < controller.appointmentTypes.length;
                                i++)
                              AppointmentType(
                                title: controller.appointmentTypes[i],
                                index: i,
                                controller: controller,
                              )
                          ],
                        ),
                      ),
                    ),
                    actions: [],
                  ),
                  
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      
                        SizedBox(height: 25.h),
                        if (controller.selectedAppointmentType.value == 0)
                          ...upComingAppointments
                        else
                          ...previousAppointments
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
