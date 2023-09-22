import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/messages_screen_controler.dart';

class MessagesScreen extends GetView<MessagesController> {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Center(
        child: Text('Messages Screen Content'),
      ),
    );
  }
}