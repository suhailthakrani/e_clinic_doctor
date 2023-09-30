import 'dart:convert';

import 'package:e_clinic_dr/controllers/appointments/appointments_screen_cntroller.dart';
import 'package:e_clinic_dr/models/appointment_model.dart';
import 'package:e_clinic_dr/services/appointment_service.dart';
import 'package:e_clinic_dr/utils/app_enum.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
    required this.status,
    required this.appointment,
    required this.controller,
  }) : super(key: key);
  final Appointment appointment;
  final AppointmentStatus status;
  final AppointmentsController controller;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (context, w) => Container(
        margin: EdgeInsets.only(bottom: 25.h),
        padding:
            EdgeInsets.only(top: 10.h, bottom: 4.h, right: 16.w, left: 16.w),
        height: 145.h,
        width: 330.w,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(249, 246, 244, 1),
          borderRadius: BorderRadius.circular(10.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.w,
              spreadRadius: 5.w,
              offset: Offset(0.w, 5.w),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    appointment.image,
                    height: 50.h,
                    width: 50.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.patientName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        appointment.type,
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (status == AppointmentStatus.completed)
                  Chip(
                    avatar: const Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      color: kGreenNormalColor,
                    ),
                    label: Text(
                      AppointmentStatus.completed.name
                              .toString()
                              .capitalizeFirst ??
                          '',
                      style: const TextStyle(
                        color: kGreenNormalColor,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: kFieldBorderColor,
                  )
                else if (status == AppointmentStatus.cancelled)
                  const Chip(
                    avatar: Icon(
                      CupertinoIcons.multiply_circle,
                      color: kWhiteColor,
                    ),
                    label: Text(
                      "Cancelled",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: Colors.redAccent,
                  )
                else if (status == AppointmentStatus.pending)
                  Chip(
                    avatar: const Icon(
                      CupertinoIcons.time,
                      color: kYellowColor,
                    ),
                    label: Text(
                      AppointmentStatus.pending.name.capitalizeFirst.toString(),
                      style: const TextStyle(
                        color: kYellowColor,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: kFieldBorderColor,
                  ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  controller.convertDateFormat(appointment.date),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  controller.convertToAMPM(appointment.time),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: (status == AppointmentStatus.pending),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    appointment.charges != 0
                        ? Chip(
                            label: Text(
                              "Paid: \$${appointment.charges}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            backgroundColor: kGreenNormalColor.withOpacity(0.7),
                          )
                        : SizedBox(),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () async {
                        await controller.rejectAppointment(appointment.id);
                      },
                      child: const Chip(
                        avatar: Icon(
                          CupertinoIcons.multiply_circle,
                          color: kWhiteColor,
                        ),
                        label: Text(
                          "Cancel",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kRequiredRedColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () async {
                        await AppointmentService()
                            .acceptAppointment(appId: appointment.id);
                      },
                      child: const Chip(
                        avatar: Icon(
                          Icons.check_circle_outline,
                          color: kWhiteColor,
                        ),
                        label: Text(
                          "Accept",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kGreenNormalColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: (status == AppointmentStatus.completed),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    appointment.charges != 0
                        ? Chip(
                            label: Text(
                              "Paid: \$${appointment.charges}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            backgroundColor: kGreenNormalColor.withOpacity(0.7),
                          )
                        : SizedBox(),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () async {
                        Map<String, String> appointmentData = {
                          "id": appointment.id,
                          "patient_name": appointment.patientName,
                          "date": appointment.date,
                          "time": appointment.time,
                          "type": appointment.type,
                          "charges": appointment.charges.toString(),
                          "message": appointment.message,
                          "image": appointment.image,
                        };

                        await Get.toNamed(
                          kPrescriptionScreenRoute,
                          arguments: appointmentData,
                        );
                      },
                      child: Chip(
                        label: const Text(
                          "Prescribe",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kPrimaryColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kWriteReportScreenRoute);
                      },
                      child: Chip(
                        label: const Text(
                          "Write Report",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        backgroundColor: kBlueColor.withOpacity(0.7),
                      ),
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
