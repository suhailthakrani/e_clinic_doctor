import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';

class MainScreenController extends GetxController {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  
  final RxInt selectedScreenIndex = 0.obs;
  RxBool disableEditAcountEdtals = true.obs;

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); 
  }

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

  
}