part of 'signup_screen.dart';

class _SignupViewModel extends GetxController {
  /// Firebase Auth instance.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Email controller.
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  /// Password controller.
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  /// Username controller.
  final TextEditingController _usernameController = TextEditingController();

  TextEditingController get usernameController => _usernameController;

  /// User Service.
  final UserRepository _userRepository = Get.find();

  /// Flag indicating page is loading.
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  /// Login error message.
  String? _error;

  String? get error => _error;

  /// Attempt to signup.
  void signup() async {
    _isLoading = true;
    update();

    try {
      // Create user in auth.
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Create user object.
      UserModel user = UserModel(
        uid: userCredential.user!.uid,
        username: _usernameController.text,
        email: _emailController.text,
      );

      // Create user in Firestore database.
      await _userRepository.createUser(user: user);

      // Proceed to app.
      Get.toNamed(Globals.ROUTES_HOME);
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
