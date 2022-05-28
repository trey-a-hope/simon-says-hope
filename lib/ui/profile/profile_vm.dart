part of 'profile_screen.dart';

class _ProfileViewModel extends GetxController {
  /// Users Repository.
  final AuthService _authService = Get.find();

  /// Current user of the app.
  UserModel? _user;
  UserModel? get user => _user;

  @override
  void onInit() async {
    _load();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Load the page.
  void _load() async {
    try {
      // Fetch the current user.
      _user = await _authService.getCurrentUser();
      update();
    } catch (e) {
      print(e);
    }
  }
}
