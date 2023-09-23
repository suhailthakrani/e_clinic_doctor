import 'package:e_clinic_dr/controllers/settings/account_settings_screen_controller.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
import 'package:e_clinic_dr/ui/widgets/custom_tile.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountSettingsScreen extends GetView<AccountSettingsController> {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Account Settings",
              style: TextStyle(fontSize: 24.w, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                          color: kFieldShadowColor, offset: Offset(-1, -1)),
                      BoxShadow(color: kFieldShadowColor, offset: Offset(1, 1))
                    ]),
                padding: EdgeInsets.all(8.w),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTile(title: 'Personal Info', onTap: () {}),
                    Divider(),
                    CustomTile(title: 'Professional Info', onTap: () {}),
                    Divider(),
                    CustomTile(title: 'Email', onTap: () {}),
                    Divider(),
                    CustomTile(title: 'Phone Number', onTap: () {}),
                    Divider(),
                    CustomTile(title: 'Password', onTap: () {}),
                    Divider(),
                    ListTile(
                      dense: true,
                      // contentPadding: EdgeInsets.zero,
                      tileColor: kWhiteColor,
                      titleTextStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kRequiredRedColor),
                      splashColor: kFieldBorderColor,
                      title: Text('Deactivate Account'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
