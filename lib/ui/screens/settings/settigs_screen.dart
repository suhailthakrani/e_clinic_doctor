import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/ui/widgets/custom_tile.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/constants.dart';
import 'package:e_clinic_dr/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_screen_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Text(
              "Settings",
              style: TextStyle(fontSize: 28.w, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Personalize Your Account Settings",
              style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 40.h),
            Container(
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(color: kFieldShadowColor, offset: Offset(-1, -1)),
                    BoxShadow(color: kFieldShadowColor, offset: Offset(1, 1))
                  ]),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  CustomTile(
                      title: 'Account Settings',
                      onTap: () {
                        Get.toNamed(kAccountSettingsScreenRoute);
                      }),
                  Divider(),
                  CustomTile(title: 'Notifications', onTap: () {}),
                  Divider(),
                  CustomTile(
                    title: 'Logout',
                    onTap: () {},
                    icon: const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
