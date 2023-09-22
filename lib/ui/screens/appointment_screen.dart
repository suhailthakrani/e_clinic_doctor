import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/appointments_screen_cntroller.dart';

class AppointmentsScreen extends GetView<AppointmentsController> {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: Center(
        child: Text('Appointments Screen Content'),
      ),
    );
  }
}
