import 'dart:convert';

import 'package:e_clinic_dr/utils/text_field_manager.dart';
import 'package:e_clinic_dr/utils/text_filter.dart';
import 'package:get/get.dart';

import '../models/availability_model.dart';
import '../ui/appointments/components/appointment_type_widget.dart';
import 'package:flutter/services.dart' show rootBundle;

class AvailabilityController extends GetxController {
  TextFieldManager timeSlotController = TextFieldManager('Time Slot Duration',
      length: 50, filter: TextFilter.none);
  TextFieldManager assignSessionController =
      TextFieldManager('Assign Session #', length: 50, filter: TextFilter.none);

  RxList<AvailabilityModel> availabilityList = <AvailabilityModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final jsonData = await _loadJsonData();
    readJsonFile(jsonData);
  }

  Future<String> _loadJsonData() async {
    return await rootBundle.loadString('assets/json/availability.json');
  }

  void readJsonFile(String jsonData) {
    List<dynamic> availabilityListData = jsonDecode(jsonData)['availability'];
    for (var availabilityData in availabilityListData) {
      AvailabilityModel availability = AvailabilityModel(
        day: availabilityData['day'],
        startTime: availabilityData['startTime'],
        endTime: availabilityData['endTime'],
        isActive: availabilityData['is_active'],
        appointmentInterval: availabilityData['appointment_interval'],
        buffer: availabilityData['buffer'],
      );
      availabilityList.add(availability);
    }
  }
}
