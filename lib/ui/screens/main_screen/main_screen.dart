import 'package:e_clinic_dr/ui/widgets/custom_drawer.dart';
import 'package:e_clinic_dr/ui/widgets/custom_scaffold.dart';
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
    return CustomScaffold(
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: 'Dashboard',
      // appBar: AppBar(),
      // endDrawer: const CustomDrawer(),
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
