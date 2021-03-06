part of 'create_feeling_screen.dart';

class _CreateFeelingViewModel extends GetxController {
  Feelings _feeling = Feelings.heart;

  Feelings get feeling => _feeling;

  /// Text editing controller for how your heart feels.
  final TextEditingController _heartController = TextEditingController();

  TextEditingController get heartController => _heartController;

  /// Text editing controller for how your mind feels.
  final TextEditingController _mindController = TextEditingController();

  TextEditingController get mindController => _mindController;

  /// Text editing controller for how your soul feels.
  final TextEditingController _soulController = TextEditingController();

  TextEditingController get soulController => _soulController;

  /// Feelings Repository
  final FeelingRepository _feelingRepository = Get.find();

  /// FCM Service
  final FCMService _fcmService = Get.find();

  /// Get storage instance.
  GetStorage _getStorage = Get.find();

  /// The partner.
  final UserModel _partnerUser = Get.arguments['partnerUser'];

  /// The current user.
  final UserModel _currentUser = Get.arguments['currentUser'];

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Increment step.
  void incrementStep() {
    _feeling = Feelings.values[_feeling.index + 1];
    update();
  }

  /// Decrement step.
  void decrementStep() {
    _feeling = Feelings.values[_feeling.index - 1];
    update();
  }

  /// Submit form.
  void submit() async {
    try {
      // Create feeling object.
      final FeelingModel feeling = FeelingModel(
        uid: _getStorage.read('uid'),
        heart: _heartController.text,
        mind: _mindController.text,
        soul: _soulController.text,
        created: DateTime.now(),
      );

      // Submit feeling to repository.
      await _feelingRepository.createFeeling(feeling: feeling);

      // Send push notification to user.
      if (_partnerUser.fcmToken != null) {
        await _fcmService.sendNotificationToUser(
          fcmToken: _partnerUser.fcmToken!,
          title: 'Don\'t forget about ${_currentUser.username}\'s feelings!',
          body: 'See what they\'re feeling right now.',
        );
      }

      // Send user to success screen.
      Get.toNamed(Globals.ROUTES_CREATE_FEELING_SUCCESS);
    } catch (e) {
      print(e);
    }
  }
}
