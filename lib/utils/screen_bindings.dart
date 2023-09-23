import 'package:e_clinic_dr/controllers/account_settings_screen_controller.dart';
import 'package:e_clinic_dr/controllers/login_screen_controller.dart';
import 'package:e_clinic_dr/controllers/main_screen_controller.dart';
import 'package:e_clinic_dr/controllers/test_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/appointments_screen_cntroller.dart';
import '../controllers/availability_screen_controller.dart';
import '../controllers/messages_screen_controler.dart';
import '../controllers/my_ratings_screen_controller.dart';
import '../controllers/payment_sreen_controller.dart';
import '../controllers/settings_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(()=>TestScreenController());
    Get.lazyPut(()=>SplashScreenController());
    Get.lazyPut(()=> MainScreenController());
    Get.lazyPut(() => MessagesController());
    Get.lazyPut(() => AppointmentsController());
    Get.lazyPut(() => AvailabilityController());
    Get.lazyPut(() => PaymentsController());
    Get.lazyPut(() => RatingsController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => AccountSettingsController());
  }
}
