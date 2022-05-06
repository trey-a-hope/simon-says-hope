part of 'create_feeling_screen.dart';

class _CreateFeelingViewModel extends GetxController {
  /// Current step in the form.
  int _currentStep = 1;

  int get currentStep => _currentStep;

  /// Text editing controller for how your heart feels.
  final TextEditingController _heartController = TextEditingController();

  TextEditingController get heartController => _heartController;

  /// Text editing controller for how your mind feels.
  final TextEditingController _mindController = TextEditingController();

  TextEditingController get mindController => _mindController;

  /// Text editing controller for how your soul feels.
  final TextEditingController _soulController = TextEditingController();

  TextEditingController get soulController => _soulController;

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
    _currentStep++;
    update();
  }

  /// Decrement step.
  void decrementStep() {
    _currentStep--;
    update();
  }

  /// Submit form.
  void submit() {
    Get.toNamed(Globals.ROUTES_CREATE_FEELING_SUCCESS);
  }
}
