import 'package:e_clinic_dr/utils/colors.dart';
import 'package:e_clinic_dr/utils/route_management.dart';
import 'package:e_clinic_dr/utils/screen_bindings.dart';
import 'package:e_clinic_dr/utils/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // HttpOverrides.global = new MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,

    // statusBarBrightness: Brightness.dark
  ));
  bool userLoggedIn = await UserSession().isUserLoggedIn();
  runApp( MyApp(isLoggedIn: userLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("-------------------------${isLoggedIn}");
    return GetMaterialApp(
      title: kAppName,
      initialRoute: kLoginScreenRoute,
      initialBinding: ScreensBindings(),
      getPages: RouteManagement.getPages(),
      theme: ThemeData(primaryColor: const Color.fromRGBO(87, 98, 182, 1)),
      // theme: ThemeData(primarySwatch: MaterialC),
      debugShowCheckedModeBanner: false,
    );
  }
}
