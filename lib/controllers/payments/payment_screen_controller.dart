import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/screens/payments/components/payment_method_card.dart';
import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';

class PaymentsController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  
  RxInt selectedPaymentIndex = 0.obs;
  RxBool disableEditAcountEdtals = true.obs;
  void changeEditMode(bool enableEditMode) {
    disableEditAcountEdtals.value = enableEditMode;
    notifyChildrens();
  }

  TextFieldManager bankNameController =
  TextFieldManager('Bank Name', length: 50, filter: TextFilter.name);
  TextFieldManager branchNameController =
  TextFieldManager('Branch Name', length: 50, filter: TextFilter.name);
  TextFieldManager accountController =
  TextFieldManager('Account Number', length: 50, filter: TextFilter.alphaNumeric);
  TextFieldManager accountHolderController =
  TextFieldManager('Account Holder Name', length: 50, filter: TextFilter.name);
  
  RxList<PaymentMethodTypeModel> paymentMethods = [
    
    PaymentMethodTypeModel(
      title: "Credit Card",
      icon: Icons.credit_card,
      
    ),
    
    PaymentMethodTypeModel(
      title: "Apple Pay",
      icon: Icons.credit_card,
      
    ),
  ].obs;

  TextFieldManager requestAmountController = TextFieldManager('Request Payment', length: 50, filter: TextFilter.email);
  TextFieldManager descriptionController = TextFieldManager('Description', length: 50, filter: TextFilter.none);
  
  DropdownController accountNumberDDController = DropdownController(
    title: "Choose Card",
    items: ["6011 **** **** 2239", "3011 **** **** 2139"].obs,
  );

  void selectPaymentMethod(int index) {
    selectedPaymentIndex.value = index;
    notifyChildrens();
  }
}

class PaymentMethodTypeModel {
  final String title;
  final IconData icon;

  PaymentMethodTypeModel({required this.title, required this.icon});
}
