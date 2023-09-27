import 'package:e_clinic_dr/ui/widgets/custom_tile.dart';
import 'package:e_clinic_dr/ui/widgets/widget_svg.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class CustomDrawer extends Drawer {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: const EdgeInsets.only(bottom: 30, top: 8),
            padding: EdgeInsets.zero,
            child: Container(
              // color: kBlueColor,
              child: Image.asset('assets/images/dr_illus.png'),
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/dashboard.png',
                scale: 0.1,
                color: kBlueColor,
              ),
            ),
            // titleFontSize: 18,
            onTap: () {
              Get.offAllNamed(kMainScreenRoute,
                  predicate: ((route) => route.isFirst));
            },
          ),
          ListTile(
            title: const Text('Messages'),
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/messages.png',
                scale: 0.1,
                color: kBlueColor,
              ),
            ),
            // titleFontSize: 18,
            onTap: () {
              Get.offAllNamed(kMessagesScreenRoute,
                  predicate: ((route) => route.isFirst));
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/appointments.png',
                color: kBlueColor,
              ),
            ),
            title: const Text('Appointments'),
            onTap: () {
              Get.offAllNamed(kAppointmentsScreenRoute,
                  predicate: ((route) => route.isFirst));
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/availability.png',
                scale: 0.1,
                color: kBlueColor,
              ),
            ),
            title: const Text('Availability'),
            onTap: () {
              Get.offAllNamed(kAvailabilityScreenRoute,
                  predicate: ((route) => route.isFirst));
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/payments.png',
                scale: 0.1,
                color: kBlueColor,
              ),
            ),
            title: const Text('Payments'),
            onTap: () {
              Get.offAllNamed(kPaymentScreenRoute,
                  predicate: ((route) => route.isFirst));
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/ratings.png',
                scale: 0.1,
                color: kBlueColor,
              ),
            ),
            title: const Text('Ratings'),
            onTap: () {
              Get.offAllNamed(kRatingsScreenRoute,
                  predicate: ((route) => route.isFirst));
            },
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/images/settings.png',
                scale: 0.1,
                color: kBlueColor,
              ),
            ),
            title: const Text('Settings'),
            onTap: () {
              Get.offAllNamed(kSettingsScreenRoute,
                  predicate: ((route) => route.isFirst));
            },
          ),
          // ListTile(
          //   leading: Padding(
          //     padding: const EdgeInsets.all(12),
          //     child: Image.asset(
          //       'assets/images/logout.png',
          //       scale: 0.1,
          //       color: kBlueColor,
          //     ),
          //   ),
          //   title: const Text('Logout'),
          //   onTap: () {
          //     // Get.offNamed(kSettingsScreenRoute, predicate: ((route) => route.isFirst));
          //   },
          // ),
        ],
      ),
    );
  }
}
