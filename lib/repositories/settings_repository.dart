import 'package:get/get.dart';
import 'package:simon_says_hope/services/hive_service.dart';

class SettingsRepository extends GetxService {
  /// Title of the hive box.
  final String _boxName = 'settings';

  /// Hive service.
  final HiveService _hiveService = Get.find();

  /// Put settings value.
  Future<void> put({
    required String key,
    required dynamic value,
  }) async {
    try {
      return await _hiveService.put(boxName: _boxName, key: key, value: value);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  /// Get settings value.
  Future<dynamic> get({
    required String key,
  }) async {
    try {
      return await _hiveService.get(boxName: _boxName, key: key);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
