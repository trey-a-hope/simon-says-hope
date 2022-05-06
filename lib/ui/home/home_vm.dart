part of 'home_screen.dart';

class _HomeViewModel extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createFeeling() {
    Get.toNamed(Globals.ROUTES_CREATE_FEELING);
  }
}
