part of 'home_screen.dart';

class _HomeViewModel extends GetxController {
  /// Feelings Repository.
  final FeelingRepository _feelingRepository = Get.find();

  /// Users Repository.
  final UserRepository _userRepository = Get.find();

  /// Auth Service.
  final AuthService _authService = Get.find();

  /// List of feelings.
  List<FeelingModel>? _feelings;

  List<FeelingModel>? get feelings => _feelings;

  /// List of users, Simone and Trey.
  List<UserModel>? _users;
  List<UserModel>? get users => _users;

  /// Current user of the app.
  late UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  @override
  void onInit() async {
    load();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Load the page.
  void load() async {
    try {
      // Fetch current user of the app.
      _currentUser = await _authService.getCurrentUser();

      // Fetch the two users of the app.
      _users = await _userRepository.retrieveUsers();

      // Fetch feelings.
      retrieveFeelings();
    } catch (e) {
      print(e);
    }
  }

  void retrieveFeelings() async {
    _feelings = await _feelingRepository.retrieveFeelings();
    update();
  }
}
