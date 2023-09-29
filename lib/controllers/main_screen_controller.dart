import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/appointments/components/appointment_card.dart';
import '../utils/app_enum.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final RxInt selectedScreenIndex = 0.obs;
  RxBool disableEditAcountEdtals = true.obs;

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back();
  }

  void changeEditMode(bool enableEditMode) {
    disableEditAcountEdtals.value = enableEditMode;
    notifyChildrens();
  }

  TextFieldManager bankNameController =
      TextFieldManager('Bank Name', length: 50, filter: TextFilter.name);
  TextFieldManager branchNameController =
      TextFieldManager('Branch Name', length: 50, filter: TextFilter.name);
  TextFieldManager accountController = TextFieldManager('Account Number',
      length: 50, filter: TextFilter.alphaNumeric);
  TextFieldManager accountHolderController = TextFieldManager(
      'Account Holder Name',
      length: 50,
      filter: TextFilter.name);

  List<AppointmentCard> upComingAppointments = [
    const AppointmentCard(
      drName: "Mary Freund",
      category: "General Checkup",
      image: "assets/images/doctor.png",
      status: AppointmentStatus.pending,
    ),
    const AppointmentCard(
      drName: "Kathy Pacheco",
      category: "Pyscology",
      image: "assets/images/doctor.png",
      status: AppointmentStatus.pending,
    ),
    const AppointmentCard(
      drName: "Rodger Struck",
      category: "Carminology",
      image: "assets/images/doctor.png",
      status: AppointmentStatus.pending,
    ),
    const AppointmentCard(
      drName: "Rodger Struck",
      category: "Carminology",
      image: "assets/images/doctor.png",
      status: AppointmentStatus.pending,
    ),
  ];
}
