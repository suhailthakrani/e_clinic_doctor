import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/ui/widgets/custom_tile.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/constants.dart';
import 'package:e_clinic_dr/utils/text_styles.dart';
import 'package:e_clinic_dr/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/settings/settings_screen_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        title: Text(
          "Account Settings",
          style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Settings",
              //   style: TextStyle(fontSize: 28.w, fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 8.h),
              Text(
                "Personalize Your Account Settings",
                style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.h),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Container(
                  height: Get.height * 0.7,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    children: [
                      CustomTile(
                          title: 'Account Settings',
                          onTap: () {
                            Get.toNamed(kAccountSettingsScreenRoute);
                          }),
                      const Divider(),
                      CustomTile(
                          title: 'Notifications',
                          onTap: () {
                            Get.toNamed(kNotificationSettingsScreenRoute);
                          }),
                      const Divider(),
                      CustomTile(
                        title: 'Logout',
                        onTap: () async {
                          await controller.logOut();
                        },
                        icon: const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
