import 'package:e_clinic_dr/ui/widgets/custom_drawer.dart';
import 'package:e_clinic_dr/ui/widgets/widget_svg.dart';
import 'package:e_clinic_dr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/main_screen_controller.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: Get.width * 0.4,
        backgroundColor: kWhiteColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: WSvgWidget(
            imageUrl: 'assets/images/logo.svg',
            height: 120,
          ),
        ),
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: kBlack45Color,
              )),
          SizedBox(
            width: 55,
            height: 10,
            child: Card(
              margin: const EdgeInsets.all(8),
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/doctor.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.scaffoldKey.currentState!.openEndDrawer();
            },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(8)),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/drawer_icon.png',
                fit: BoxFit.contain,
                height: 30,
                width: 30,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          )
        ],
      ),
      endDrawer: const CustomDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                title: Text('Total Payments'),
                trailing: Text('\$1000'), // Replace with actual data
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Total Appointments'),
                trailing: Text('50'), // Replace with actual data
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Total Income'),
                trailing: Text('\$2000'), // Replace with actual data
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Today's Appointments"),
                trailing: Text('10'), // Replace with actual data
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Patient Reviews'),
                trailing: Text('4.8'), // Replace with actual data
              ),
            ),
            // Add more cards/widgets for other metrics
          ],
        ),
      ),
    );
  }
}
