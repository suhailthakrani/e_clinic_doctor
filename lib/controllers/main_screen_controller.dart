import 'dart:developer';

import 'package:e_clinic_dr/models/appointment_model.dart';
import 'package:e_clinic_dr/models/doctor_model.dart';
import 'package:e_clinic_dr/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/me_model.dart';
import '../services/appointment_service.dart';
import '../services/user_service.dart';
import '../ui/screens/appointments/components/appointment_card.dart';
import '../utils/app_enum.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import '../utils/user_session.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList<Appointment> appointmentsRequests = <Appointment>[].obs;
  RxList<Appointment> appointmentsCompleted = <Appointment>[].obs;

  @override
  Future<void> onReady() async {
    if (UserSession.userModel.value.email.isNotEmpty) {
      MeModel meModel = await UserService().getMyData();
      print("---------------------${meModel.toJson()}");
      await UserSession().saveMe(me: meModel);
      MeModel meModel2 = await UserSession().getMe();
      log("-----------------------${meModel2}");
      appointmentsRequests.value =
          await AppointmentService().getRequestedAppointmentsList();
      appointmentsCompleted.value =
          await AppointmentService().getCompletedAppointmentsList();
    }
    super.onReady();
  }

  String convertDateFormat(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('d MMMM y').format(dateTime);
    return formattedDate;
  }

  String convertToAMPM(String timeString) {
    DateTime dateTime = DateFormat('HH:mm').parse(timeString);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }
}
