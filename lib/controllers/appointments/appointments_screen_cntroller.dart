import 'package:e_clinic_dr/models/appointment_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/date_time_manager.dart';

class AppointmentsController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    DateTimeManager sortingDate = DateTimeManager("Date of Birth",
      firstDate: DateTime(DateTime.now().year - 80),
      lastDate: DateTime(
          DateTime.now().year - 18, DateTime.now().month, DateTime.now().day));
    
          
  List<String> appointmentTypes = [
    'Upcoming',
    'Previous',
  ];
  RxInt selectedAppointmentType = 0.obs;

  void selectAppointmentType(int index) {
    selectedAppointmentType.value = index;
  }
}
