import 'package:e_clinic_dr/models/availability_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleAvailabilityWidget extends StatelessWidget {
  final Rx<AvailabilityModel> availability;

  SingleAvailabilityWidget(this.availability);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Day: ${availability.value.day}'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: availability.value.startTime,
                    decoration: InputDecoration(labelText: 'From'),
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          DateTime.parse(availability.value.startTime),
                        ),
                      );
                      if (picked != null) {
                        availability.value.copyWith(startTime: picked.toString());
                      }
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    initialValue: availability.value.endTime,
                    decoration: InputDecoration(labelText: 'To'),
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                          DateTime.parse(availability.value.endTime),
                        ),
                      );
                      if (picked != null) {
                        availability.value.copyWith(endTime: picked. toString());
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add more time
                  },
                  child: Text('Add More Time'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Copy
                  },
                  child: Text('Copy'),
                ),
                ElevatedButton(
                  onPressed: () {
                    //TODO: // must be deleted
                    // availability.value.copyWith(isActive: false);
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Obx(
              () => Switch(
                value: availability.value.isActive,
                onChanged: (value) {
                  availability.value.copyWith(isActive: value);
                },
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: availability.value.appointmentInterval.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Appointment Interval (min)'),
                    onChanged: (value) {
                      availability.value.copyWith(appointmentInterval: int.tryParse(value) ?? 0);
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    initialValue: availability.value.buffer.toString(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Buffer (min)'),
                    onChanged: (value) {
                      availability.value.copyWith(buffer: int.tryParse(value) ?? 0);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
