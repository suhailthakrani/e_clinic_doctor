import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/availability_screen_controller.dart';

class AvailabilityScreen extends GetView<AvailabilityController> {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Availability'),
      ),
      body: Center(
        child: Text('Availability Screen Content'),
      ),
    );
  }
}
