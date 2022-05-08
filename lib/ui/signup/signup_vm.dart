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

  /// Attempt to signup.
  void signup() async {
    try {
      // Create user in auth.
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Create user object.
      // UserModel user = UserModel(
      //   uid: userCredential.user!.uid!,
      //   username: _usernameController.text,
      //   email: _emailController.text,
      // );

      // Create user in Firestore database.
      // await _userService.createUser(user: user);

      // Proceed to app.
      Get.toNamed(Globals.ROUTES_HOME);
    } catch (e) {}
  }
}
