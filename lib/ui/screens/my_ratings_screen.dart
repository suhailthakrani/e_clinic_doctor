import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/my_ratings_screen_controller.dart';

class RatingsScreen extends GetView<RatingsController> {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ratings'),
      ),
      body: Center(
        child: Text('Ratings Screen Content'),
      ),
    );
  }
}
