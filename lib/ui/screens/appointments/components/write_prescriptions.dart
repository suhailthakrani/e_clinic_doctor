import 'package:e_clinic_dr/controllers/appointments/prescription_screen_controller.dart';
import 'package:e_clinic_dr/ui/widgets/button2.dart';
import 'package:e_clinic_dr/ui/widgets/general_text_field.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrescriptionsScreen extends GetView<PrescriptionScreenController> {
  const PrescriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        title: const Text('Add Prescription'),
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
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
            Obx(
              () => ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  controller.imageUrl.value,
                  height: 70.h,
                  width: 70.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
            ),
            GeneralTextField.withShadow(
              tfManager: controller.appointIdController,
              paddingHorizontal: 0,
            ),
            GeneralTextField.withShadow(
              tfManager: controller.patientNameController,
              paddingHorizontal: 0,
            ),
            GeneralTextField.withShadow(
              tfManager: controller.appointmnDateController,
              paddingHorizontal: 0,
            ),
            GeneralTextField.withShadow(
              tfManager: controller.appointmntTimeController,
              paddingHorizontal: 0,
            ),
            GeneralTextField.withShadow(
              tfManager: controller.chargesController,
              paddingHorizontal: 0,
            ),
            GeneralTextField.withShadow(
              tfManager: controller.descriptionController,
              paddingHorizontal: 0,
            ),
            const Text(
              'Analysis & Recommendations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Flexible(
                  child: GeneralTextField.withShadow(
                    tfManager: controller.diagnosis1Controller,
                    paddingHorizontal: 0,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: GeneralTextField.withShadow(
                    tfManager: controller.diagnosis2Controller,
                    paddingHorizontal: 0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: GeneralTextField.withShadow(
                    tfManager: controller.diagnosis3Controller,
                    paddingHorizontal: 0,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: GeneralTextField.withShadow(
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
        ),
      ),
    );
  }
}
