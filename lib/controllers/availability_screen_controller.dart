import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic_dr/utils/common_code.dart';
import 'package:e_clinic_dr/utils/text_field_manager.dart';
import 'package:e_clinic_dr/utils/text_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/availability_model.dart';
import '../services/availability_service.dart';
import '../ui/widgets/custom_dialogs.dart';
import '../ui/widgets/custom_progress_dialog.dart';
import '../utils/dropdown_controller.dart';

class AvailabilityController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager timeSlotController = TextFieldManager('Time Slot Duration',
      length: 50, filter: TextFilter.number, hint: 'Enter Time');
  TextFieldManager assignSessionController =
      TextFieldManager('Assign Session #', length: 50, filter: TextFilter.number, hint: 'Enter Session');

  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  DropdownController timeSlotDDController = DropdownController(
    title: "Exprience",
    items: [
      '10',
      '15',
      '20',
      '25',
      '30',
      '40',
      '1.5 Hour'
      '1 Hour'
      '2 Hour'
    ].obs,
  );

  RxInt selectedIndex = 0.obs;

  RxList<AvailabilityModel> availabilityList = <AvailabilityModel>[
    AvailabilityModel(
        day: 'monday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'tuesday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'wednesday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'thursday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'friday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'saturday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
    AvailabilityModel(
        day: 'sunday',
        startTime: '',
        endTime: '',
        isActive: false,
        appointmentInterval: 0,
        buffer: 0),
  ].obs;

  Future<String> showTimestampPicker(BuildContext context, int index) async {
    TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input);
    if (selectedTime != null) {
      DateTime now = DateTime.now();
      DateTime selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      if (index == 0) {
        selectedStartTime = selectedTime;
      }

      String formattedTimestamp = DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ")
          .format(selectedDateTime.toLocal());
      return formattedTimestamp;
    }
    return '';
  }

  void toggleStatus({required int index, required bool value}) {
    availabilityList[index] = availabilityList[index].copyWith(isActive: value);
    notifyChildrens();
  }
   void deleteTime({required int index}) {
    availabilityList[index] = availabilityList[index].copyWith(isActive: false, startTime: '', endTime: '');
    notifyChildrens();
  }


  bool validateAll() {
    for (var avail in availabilityList) {
      if (avail.isActive) {
        return avail.startTime.isNotEmpty & avail.endTime.isNotEmpty;
      }
    }
    return timeSlotController.validate() & assignSessionController.validate();
  }

  Future<void> submitAvailability() async {
    if (validateAll()) {
      for (var avail in availabilityList) {
        avail.appointmentInterval = int.parse(timeSlotController.text);
        avail.buffer = int.parse(assignSessionController.text);
      }
      ProgressDialog pd = ProgressDialog()..showDialog();
      String response = await AvailabilityService().addShedule(drID: '', availabilityList:  availabilityList);
      pd.dismissDialog();
      if (response == "Success") {
      CustomDialogs() .showDialog("Success", response, DialogType.success);
      } else {
        CustomDialogs().showDialog("Alert", response, DialogType.error);
      }
        
    } else{
      CommonCode().showToast(message: "Please enter valid data!");
    }
  }
}
