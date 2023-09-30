import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/main_screen_controller.dart';
import '../appointments/appointments_list.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'MainScreen',
      // appBar: AppBar(),
      // endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Patients",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "2000",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/patients.png',
                            height: 50, width: 50),
                      ),
                    ],
                  ),
                )),
            Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Appointments",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "9600",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/appointments.png',
                            height: 50, width: 50),
                      ),
                    ],
                  ),
                )),
            Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        "\$9600",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/cash.png',
                            height: 50, width: 50),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 16.h),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's Appointments",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     //
                        //   },
                        //   child: const Text(
                        //     "See All",
                        //     style: TextStyle(
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w500,
                        //       color: kBlueColor,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: kBlueColor,
                            )),
                        SizedBox(width: 8.h),
                        Text(
                          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8.h),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: kBlueColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => Column(
                        children: [
                          for (int i = 0;
                              i <
                                  (controller.appointmentsCompleted.length <= 7
                                      ? controller.appointmentsCompleted.length
                                      : 7);
                              i++)
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          controller.convertToAMPM(
                                            controller
                                                .appointmentsCompleted[i].time,
                                          ),
                                        )),
                                    Expanded(
                                      flex: 6,
                                      child: Card(
                                        elevation: 4,
                                        color: i == 0
                                            ? Theme.of(context).canvasColor
                                            : kWhiteColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .appointmentsCompleted[i]
                                                    .type,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                  'Paid: \$${controller.appointmentsCompleted[i].charges}'),
                                              SizedBox(height: 8.h),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.network(
                                                  controller
                                                      .appointmentsCompleted[i]
                                                      .image,
                                                  height: 50.h,
                                                  width: 50.w,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Container(),
                                                ),
                                              ),
                                              SizedBox(height: 4.h),
                                              Text(
                                                controller
                                                    .appointmentsCompleted[i]
                                                    .patientName,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Text(
                                                controller.convertDateFormat(
                                                    controller
                                                        .appointmentsCompleted[
                                                            i]
                                                        .date),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.call,
                                                    color: kBlueColor,
                                                  ),
                                                  SizedBox(width: 8.w),
                                                  const Icon(
                                                    Icons.message,
                                                    color: kBlueColor,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Total: ${controller.appointmentsCompleted.length}",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Appointment Requests",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: const Text(
                        //     "See All",
                        //     style: TextStyle(
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.w500,
                        //       color: kBlueColor,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => ListView.separated(
                        padding: const EdgeInsets.all(2),
                        shrinkWrap: true,
                        itemCount: (controller.appointmentsCompleted.length <= 7
                            ? controller.appointmentsCompleted.length
                            : 7),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  controller.appointmentsRequests[index].image,
                                  height: 50.h,
                                  width: 50.w,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.appointmentsRequests[index]
                                          .patientName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      controller
                                          .appointmentsRequests[index].type,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: kBlueColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      controller.convertDateFormat(controller
                                          .appointmentsRequests[index].date),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: kRequiredRedColor,
                                    foregroundColor: kWhiteColor,
                                    radius: 14,
                                    child: Icon(
                                      CupertinoIcons.multiply,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  CircleAvatar(
                                    backgroundColor: kGreenNormalColor,
                                    foregroundColor: kWhiteColor,
                                    radius: 14,
                                    child: Icon(
                                      Icons.check,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                        separatorBuilder: (_, int index) =>
                            const SizedBox(height: 8),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Total: ${controller.appointmentsRequests.length}",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
