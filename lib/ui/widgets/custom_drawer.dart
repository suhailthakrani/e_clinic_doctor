import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class CustomDrawer extends Drawer {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          children: [
           ListTile(
              title: Text('Messages'),
              onTap: () {
                Get.offNamed(kMessagesScreenRoute);
              },
            ),
            ListTile(
              title: Text('Appointments'),
              onTap: () {
                Get.offNamed(kAppointmentsScreenRoute);
              },
            ),
            ListTile(
              title: Text('Availability'),
              onTap: () {
                Get.offNamed(kAvailabilityScreenRoute);
              },
            ),
            ListTile(
              title: Text('Payments'),
              onTap: () {
                Get.offNamed(kPaymentScreenRoute);
              },
            ),
            ListTile(
              title: Text('Ratings'),
              onTap: () {
                Get.offNamed(kRatingsScreenRoute);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Get.offNamed(kSettingsScreenRoute);
              },
            ),
          ],
        ),
      );
  }
}