import 'package:e_clinic_dr/utils/colors.dart';
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
            DrawerHeader(child: Container(color: kPrimaryColor,)),
           ListTile(
              title: const Text('Messages'),
              onTap: () {
                Get.offAllNamed(kMessagesScreenRoute, predicate: ((route) => route.isFirst));
                // Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Appointments'),
              onTap: () {
                Get.offAllNamed(kAppointmentsScreenRoute, predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              title: const Text('Availability'),
              onTap: () {
                Get.offAllNamed(kAvailabilityScreenRoute, predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              title: const Text('Payments'),
              onTap: () {
                Get.offAllNamed(kPaymentScreenRoute, predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              title: const Text('Ratings'),
              onTap: () {
                Get.offAllNamed(kRatingsScreenRoute, predicate: ((route) => route.isFirst));
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Get.offAllNamed(kSettingsScreenRoute, predicate: ((route) => route.isFirst));
              },
            ),
             ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Get.offNamed(kSettingsScreenRoute, predicate: ((route) => route.isFirst));
              },
            ),
          ],
        ),
      );
  }
}