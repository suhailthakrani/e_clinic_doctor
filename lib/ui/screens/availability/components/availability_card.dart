import 'package:e_clinic_dr/models/availability_model.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SingleAvailabilityWidget extends StatelessWidget {
  final Rx<AvailabilityModel> availability;

  const SingleAvailabilityWidget(this.availability);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Switch(
                    value: availability.value.isActive,
                    onChanged: (value) {
                      availability.value.copyWith(isActive: value);
                    },
                  ),
                ),
                Text(availability.value.day.capitalizeFirst ?? ''),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: availability.value.startTime,
                    decoration: const InputDecoration(labelText: 'Start Time'),
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          DateTime.parse(availability.value.startTime),
                        ),
                      );
                      if (picked != null) {
                        availability.value
                            .copyWith(startTime: picked.toString());
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    initialValue: availability.value.endTime,
                    decoration: const InputDecoration(
                      labelText: 'End Time',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          DateTime.parse(availability.value.endTime),
                        ),
                      );
                      if (picked != null) {
                        availability.value.copyWith(endTime: picked.toString());
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.delete,
                      color: kRequiredRedColor,
                    )),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.add,
                    )),
                const SizedBox(width: 16.0),
                GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/copy.png',
                      width: 50.w,
                      height: 50.h,
                    )),
              ],
            ),
            // const SizedBox(height: 8.0),
            // Row(
            //   children: [
            //     Expanded(
            //       child: TextFormField(
            //         initialValue:
            //             availability.value.appointmentInterval.toString(),
            //         keyboardType: TextInputType.number,
            //         decoration: const InputDecoration(
            //             labelText: 'Appointment Interval (min)'),
            //         onChanged: (value) {
            //           availability.value.copyWith(
            //               appointmentInterval: int.tryParse(value) ?? 0);
            //         },
            //       ),
            //     ),
            //     const SizedBox(width: 16.0),
            //     Expanded(
            //       child: TextFormField(
            //         initialValue: availability.value.buffer.toString(),
            //         keyboardType: TextInputType.number,
            //         decoration:
            //             const InputDecoration(labelText: 'Buffer (min)'),
            //         onChanged: (value) {
            //           availability.value
            //               .copyWith(buffer: int.tryParse(value) ?? 0);
            //         },
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
