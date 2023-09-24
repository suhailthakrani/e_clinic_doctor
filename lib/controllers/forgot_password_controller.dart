import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/screens/forgot_password/components/password_reset_method.dart';

/// Created by Suhail Thakrani 23-Sep-2023
class ForgotPasswordScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt selectedIndex = 0.obs;
  List<PasswordResetMethod> passwordResetMethods = [
    PasswordResetMethod(
      image: "assets/images/msg-icon.png",
      title: "Via SMS",
      subtitle: "+11 11*****11",
      selected: false,
    ),
    PasswordResetMethod(
      image: "assets/images/mail-icon.png",
      title: "Via Email",
      subtitle: "abc@gmail.com",
      selected: false,
    ),
  ];

  void selectMethod(int index) {
    for (var element in passwordResetMethods) {
      element.selected = false;
    }
    passwordResetMethods[index].selected = true;
  }

  bool checkIfAllSelected() {
    for (var element in passwordResetMethods) {
      if (element.selected == true) {
        return true;
      }
    }
    return false;
  }
}


class ProfessionalInfoSettingsController extends GetxController {
  // Add your logic for the Password Reset Methods screen here
}
class PasswordResetMethodsController extends GetxController {
  // Add your logic for the Password Reset Methods screen here
}


class ResetPasswordBySMSController extends GetxController {
  // Add your logic for the Reset Password by SMS screen here
}

class VerificationIDController extends GetxController {
  // Add your logic for the Verification ID screen here
}

class VerificationDriverController extends GetxController {
  // Add your logic for the Verification Driver screen here
}

class VerificationPassportController extends GetxController {
  // Add your logic for the Verification Passport screen here
}

class NotificationSettingsController extends GetxController {
  // Add your logic for the Notification Settings screen here
}

class PersonalInfoSettingsController extends GetxController {
  // Add your logic for the Personal Info Settings screen here
}

class EmailSettingsController extends GetxController {
  // Add your logic for the Email Settings screen here
}

class PhoneNoSettingsController extends GetxController {
  // Add your logic for the Phone No Settings screen here
}

class PasswordSettingsController extends GetxController {
  // Add your logic for the Password Settings screen here
}

