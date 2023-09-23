import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_clinic_dr/utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';
import '../ui/widgets/custom_dialogs.dart';
import '../ui/widgets/custom_progress_dialog.dart';
import '../utils/constants.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import '../utils/user_session.dart';

/// Created by Suhail Thakrani 23-Sep-2023
class RegisterScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager firstNameController =
      TextFieldManager('First Name', length: 50, filter: TextFilter.email);
  TextFieldManager lastNameController =
      TextFieldManager('Last Name', length: 50, filter: TextFilter.none);
  TextFieldManager emailController =
      TextFieldManager('Email', length: 50, filter: TextFilter.email);
  TextFieldManager passwordController =
      TextFieldManager('Password', length: 50, filter: TextFilter.none);

  TextFieldManager phoneNoController =
      TextFieldManager('Phone Number', length: 50, filter: TextFilter.email);
  TextFieldManager specializationController =
      TextFieldManager('Specialization', length: 50, filter: TextFilter.none);
  TextFieldManager hospitalController = TextFieldManager(
      'Hospital/ Clinic Name',
      length: 50,
      filter: TextFilter.none);
  TextFieldManager cnicController =
      TextFieldManager('CNIC', length: 50, filter: TextFilter.none);
  TextFieldManager addressController =
      TextFieldManager('Address', length: 50, filter: TextFilter.none);
  TextFieldManager cityController =
      TextFieldManager('CNIC', length: 50, filter: TextFilter.none);
  TextFieldManager stateController =
      TextFieldManager('Address', length: 50, filter: TextFilter.none);

  RxBool obscureText = true.obs;

  void onObscureText() {
    if (obscureText.value) {
      obscureText.value = false;
    } else {
      obscureText.value = true;
    }
  }

  bool validateAllData() {
    bool valid = true;
    return valid &
        firstNameController.validate() &
        lastNameController.validate() &
        emailController.validate() &
        passwordController.validate() &
        phoneNoController.validate() &
        specializationController.validate() &
        cnicController.validate();
  }

  void onRegisterClicked() async {
    if (!validateAllData()) {
      CommonCode().showToast(message: 'Please Enter Valid Data!');
    }
    {
      UserModel userModel = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        gender: 'male',
        specialization: specializationController.text,
        degreeDocument: 'degreeDocument',
        hospitalClinicName: hospitalController.text,
        city: cityController.text,
        state: stateController.text,
        address: addressController.text,
      );
      ProgressDialog pd = ProgressDialog()..showDialog();
      await UserService().registerUser(userModel: userModel);
      pd.dismissDialog();
      if (userModel.responseMessage == 'Success') {
        await UserSession().createSession(user: userModel);
        Get.offAllNamed(kMainScreenRoute);
      } else {
        pd.dismissDialog();
        CustomDialogs()
            .showDialog("Alert", userModel.responseMessage, DialogType.error);
      }
    }
  }
}
