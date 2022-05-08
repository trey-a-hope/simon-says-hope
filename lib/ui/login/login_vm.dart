part of 'login_screen.dart';

class _LoginViewModel extends GetxController {
  /// Auth service.
  final AuthService _authService = Get.find();

  /// Email controller.
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  /// Password controller.
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  /// Flag indicating page is loading.
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  /// Login error message.
  String? _error;

  String? get error => _error;

  @override
  void onInit() async {
    super.onInit();
  }

  /// Attempt to login.
  void login() async {
    _isLoading = true;
    update();

    try {
      await _authService.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } catch (e) {
      _isLoading = false;
      _error = '$e';
      update();
    }
  }

  /// Try again, (clear error and reset form).
  void tryAgain() {
    _error = null;
    update();
  }
}
