part of 'main_screen.dart';

class _MainViewModel extends GetxController {
  /// Firebase auth instance.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Firebase messaging instance.
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// Firebase user observable.
  Rxn<User> firebaseUser = Rxn<User>();

  /// Firestore user observable.
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  /// Users database collection reference.
  final CollectionReference _usersDB =
  FirebaseFirestore.instance.collection('users');

  /// Instantiate user service.
  UserRepository _userRepository = Get.find();

  /// Get storage instance.
  GetStorage _getStorage = Get.find();

  /// Instance of new version class.
  final NewVersion _newVersion = NewVersion();

  @override
  void onReady() async {
    // Run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  /// Listens for user auth changes.
  handleAuthChanged(_firebaseUser) async {
    final VersionStatus? status = await _newVersion.getVersionStatus();

    // Proceed to Login Page if user is not logged in or there's a new version of the app.
    if (_firebaseUser == null || (status != null && status.canUpdate)) {
      Get.offAllNamed(Globals.ROUTES_LOGIN);
    }

    // Proceed to home page.
    else {
      // Get user document reference.
      DocumentReference userDocRef = _usersDB.doc(_firebaseUser.uid);

      // Check if user already exists.
      bool userExists = (await userDocRef.get()).exists;

      // Set UID to get storage.
      await _getStorage.write('uid', _firebaseUser.uid);

      // Set app version and build number.
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _getStorage.write(Globals.APP_BUILD_NUMBER, packageInfo.buildNumber);
      _getStorage.write(Globals.APP_VERSION, packageInfo.version);

      if (userExists) {
        // Request permission from user to receive push notifications.
        if (Platform.isIOS) {
          _firebaseMessaging.requestPermission();
        }

        // Fetch the fcm token for this device.
        String? token = await _firebaseMessaging.getToken();

        // Validate that it's not null.
        assert(token != null);

        // Update fcm token for this device in firebase.
        userDocRef.update({'fcmToken': token});
      } else {
        // Proceed to signup page.
        Get.offAllNamed(Globals.ROUTES_SIGNUP);
      }

      // Proceed to home page.
      Get.offAllNamed(Globals.ROUTES_HOME);
    }
  }

  // Firebase user a realtime stream.
  Stream<User?> get user => _auth.authStateChanges();
}
