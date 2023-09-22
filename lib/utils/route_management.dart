import 'package:e_clinic_dr/ui/screens/main_screen/main_screen.dart';
import 'package:e_clinic_dr/ui/screens/test_screen.dart';
import 'package:get/get.dart';

import '../ui/screens/appointment_screen.dart';
import '../ui/screens/availability_screen.dart';
import '../ui/screens/login_screen.dart';
import '../ui/screens/messages/messages_screen.dart';
import '../ui/screens/my_ratings_screen.dart';
import '../ui/screens/payment_screen.dart';
import '../ui/screens/settigs_screen.dart';
import '../ui/screens/splash_screen.dart';
import 'constants.dart';
import 'screen_bindings.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kTestScreenRoute,
        page: () => const TestScreen(),
        binding: ScreensBindings(),
      ),
       GetPage(
        name: kMainScreenRoute,
        page: () => const MainScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSplashScreenRoute,
        page: () => const SplashScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kMessagesScreenRoute,
        page: () => const MessagesScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kAppointmentsScreenRoute,
        page: () => const AppointmentsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kAvailabilityScreenRoute,
        page: () => const AvailabilityScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kPaymentScreenRoute,
        page: () => const PaymentsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kRatingsScreenRoute,
        page: () => const RatingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSettingsScreenRoute,
        page: () => const SettingsScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kLoginScreenRoute,
        page: () => const LoginScreen(),
        binding: ScreensBindings(),
      ),
      // GetPage(name: '/logout', page: () => LogoutScreen()),
    ];
  }
}
