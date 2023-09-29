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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Today's Appointments",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kBlueColor,
                            ),
                          ),
                        ),
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
                            )),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(flex: 1, child: Text("8:00 AM")),
                                Expanded(
                                  flex: 4,
                                  child: Card(
                                    elevation: 4,
                                    color: i == 0
                                        ? Theme.of(context).canvasColor
                                        : kWhiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Physical",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          const Text('Paid:\$100'),
                                          SizedBox(height: 8.h),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.asset(
                                                'assets/images/commenter.png',
                                                height: 50,
                                                width: 50),
                                          ),
                                          SizedBox(height: 4.h),
                                          const Text(
                                            "Patient Name",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          const Text(
                                            "August 16, 2023",
                                            style: TextStyle(),
                                          ),
                                          SizedBox(height: 8.h),
                                          const Text(
                                            "8:00 AM - 10:30 AM",
                                            style: TextStyle(),
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
                      ],
                    ),
                    SizedBox(height: 10.h),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Appointment Requests",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ListView.builder(
                      padding: const EdgeInsets.all(2),
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CircleAvatar(
                              child: Image.asset(
                                "assets/images/commenter.png",
                                height: 45,
                                width: 45,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Patient",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'General Checkup',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: kBlueColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Date',
                                    style: TextStyle(
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
                    ),
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
