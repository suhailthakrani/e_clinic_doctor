import 'package:get/get.dart';

class MainScreenController extends GetxController {
  final RxInt selectedScreenIndex = 0.obs;

  void selectScreen(int index) {
    selectedScreenIndex.value = index;
    Get.back(); // Close the drawer after selecting a screen
  }
}