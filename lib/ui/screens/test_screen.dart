import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/test_screen_controller.dart';
import '../../utils/constants.dart';

class TestScreen extends GetView<TestScreenController> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(kMessagesScreenRoute);
              },
              child: const Text('Messages Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(kAppointmentsScreenRoute);
              },
              child: const Text('Appointments Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(kAvailabilityScreenRoute);
              },
              child: const Text('Availability Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(kPaymentScreenRoute);
              },
              child: const Text('Payments Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(kRatingsScreenRoute);
              },
              child: const Text('Ratings Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(kSettingsScreenRoute);
              },
              child: const Text('Settings Screen'),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.toNamed(kLogoutScreenRoute);
            //   },
            //   child: Text('Logout Screen'),
            // ),
          ],
        ),
      ),
    );
  }
}