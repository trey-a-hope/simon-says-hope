part of 'home_screen.dart';

class _HomeViewModel extends GetxController {
  /// Feelings Repository.
  final FeelingRepository _feelingRepository = Get.find();

  /// List of feelings.
  List<FeelingModel> _feelings = [];

  List<FeelingModel> get feelings => _feelings;

  @override
  void onInit() async {
    super.onInit();
    _retrieveFeelings();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _retrieveFeelings() async {
    try {
      _feelings = await _feelingRepository.retrieveFeelings();
      update();
    } catch (e) {
      print(e);
    }
  }

  void refresh() async {
    _retrieveFeelings();
  }
}
