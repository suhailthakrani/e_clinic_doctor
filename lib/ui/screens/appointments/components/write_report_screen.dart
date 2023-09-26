import 'package:e_clinic_dr/ui/widgets/button2.dart';
import 'package:e_clinic_dr/ui/widgets/general_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../controllers/appointments/write_report_controller.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/general_dropdown.dart';

class WriteReportScreen extends GetView<WriteReportScreenController> {
  const WriteReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: const Text(
          'Write Report',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Patient Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              GeneralTextField.withBorder(
                tfManager: controller.patientNameController,
                paddingHorizontal: 0,
              ),
              GeneralDropdown.withBorder(
                controller: controller.genderDDController,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.ageController,
                paddingHorizontal: 0,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.patientNumberController,
                paddingHorizontal: 0,
              ),
              GeneralTextField.withBorder(
                tfManager: controller.medicalHistoryController,
                paddingHorizontal: 0,
              ),
              const Text(
                'Analysis & Recommendations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Flexible(
                    child: GeneralTextField.withBorder(
                      tfManager: controller.diagnosis1Controller,
                      paddingHorizontal: 0,
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: GeneralTextField.withBorder(
                      tfManager: controller.diagnosis2Controller,
                      paddingHorizontal: 0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: GeneralTextField.withBorder(
                      tfManager: controller.diagnosis3Controller,
                      paddingHorizontal: 0,
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: GeneralTextField.withBorder(
                      tfManager: controller.diagnosis4Controller,
                      paddingHorizontal: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: Get.width,
                child: Button2(
                  text: 'Submit',
                  onPress: () {},
                ),
              )
            ],
          )),
    );
  }
}
