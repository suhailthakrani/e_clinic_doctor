import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings_screen_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Screen Content'),
      ),
    );
  }
}
