part of 'drawer_screen.dart';

class _DrawerViewModel extends GetxController {
  /// Current user.
  UserModel? user;

  /// Instantiate auth service.
  AuthService _authService = Get.find();

  @override
  void onInit() async {
    /// Fetch the current user.
    user = await _authService.getCurrentUser();

    update();

    super.onInit();
  }
}
