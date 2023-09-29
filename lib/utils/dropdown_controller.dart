

import 'package:e_clinic_dr/utils/user_session.dart';
import 'package:get/get.dart';

class DropdownController {

  final RxString errorMessage=''.obs;
  final Rx<dynamic> selectedItem=Rx(null);
  final String title;
  final RxList<dynamic> items;

  final bool mandatory;

  DropdownController({required this.title, required this.items, this.mandatory=true,});

  bool validate(){
    if(selectedItem.value == null){
      errorMessage.value = mandatory ? "Please select $title!" : '';
    } else {
      UserSession.isDataChanged.value = true;
      errorMessage.value = "";
    }
    return errorMessage.isEmpty;
  }

  void setFirstItem(){
    if(items.isNotEmpty) {
      // if (items.length == 1) {
        selectedItem.value = items.first;
      // }
    }
  }

  void clear(){
    items.clear();
    selectedItem.value = null;
  }
}
