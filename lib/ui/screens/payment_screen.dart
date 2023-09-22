import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/payment_sreen_controller.dart';

class PaymentsScreen extends GetView<PaymentsController> {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
      ),
      body: Center(
        child: Text('Payments Screen Content'),
      ),
    );
  }
}
