import 'package:e_clinic_dr/models/appointment_type.dart';
import 'package:get/get.dart';

class AppointmentsController extends GetxController {
  List<AppointmentTypeModel> appointmentTypeList = [
    AppointmentTypeModel(
      title: 'Upcoming',
      selected: false,
    ),
    AppointmentTypeModel(
      title: 'Previous',
      selected: true,
    ),
  ];

  void selectAppointmentType(int index) {
    for (var element in appointmentTypeList) {
      element.copyWith(selected: false);
    }
    appointmentTypeList[index].copyWith(selected: true);
  }
}
