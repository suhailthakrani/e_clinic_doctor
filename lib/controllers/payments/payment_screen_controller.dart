import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/payments/components/payment_method_card.dart';

class PaymentsController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<PaymentMethodCard> paymentMethods = [
    PaymentMethodCard(
      text: "Credit Card",
      icon: Icons.credit_card,
      selected: false,
      index: 0,
    ),
    PaymentMethodCard(
      text: "Apple Pay",
      icon: Icons.apple,
      selected: false,
      index: 1,
    ),
  ];

  void selectPaymentMethod(int index) {
    for (var item in paymentMethods) {
      item.selected = false;
    }
    paymentMethods[index].selected = true;
  }
}
