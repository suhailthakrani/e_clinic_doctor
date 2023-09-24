import 'package:e_clinic_dr/controllers/prescription_screen_controller.dart';
import 'package:e_clinic_dr/controllers/register_screen_controller.dart';
import 'package:e_clinic_dr/controllers/settings/account_settings_screen_controller.dart';
import 'package:e_clinic_dr/controllers/login_screen_controller.dart';
import 'package:e_clinic_dr/controllers/main_screen_controller.dart';
import 'package:e_clinic_dr/controllers/test_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/appointments/appointments_screen_cntroller.dart';
import '../controllers/availability_screen_controller.dart';
import '../controllers/forgot_password_controller.dart';
import '../controllers/messages_screen_controler.dart';
import '../controllers/my_ratings_screen_controller.dart';
import '../controllers/payments/payment_screen_controller.dart';
import '../controllers/settings/settings_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => RegisterScreenController());
    Get.lazyPut(() => TestScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => MainScreenController());
    Get.lazyPut(() => MessagesController());
    Get.lazyPut(() => AppointmentsController());
    Get.lazyPut(() => AvailabilityController());
    Get.lazyPut(() => PaymentsController());
    Get.lazyPut(() => RatingsController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => AccountSettingsController());
    Get.lazyPut(() => PasswordResetMethodsController());
    Get.lazyPut(() => ResetPasswordBySMSController());
    Get.lazyPut(() => VerificationIDController());
    Get.lazyPut(() => VerificationDriverController());
    Get.lazyPut(() => VerificationPassportController());
    Get.lazyPut(() => NotificationSettingsController());
    Get.lazyPut(() => PersonalInfoSettingsController());
    Get.lazyPut(() => ProfessionalInfoSettingsController());
    Get.lazyPut(() => PrescriptionScreenController());

    Get.lazyPut(() => EmailSettingsController());
    Get.lazyPut(() => PhoneNoSettingsController());
    Get.lazyPut(() => PasswordSettingsController());
    Get.lazyPut(() => ForgotPasswordScreenController());
  }
}
