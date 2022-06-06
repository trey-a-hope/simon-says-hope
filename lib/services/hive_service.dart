import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService extends GetxService {
  /// Open the hive box if it's not the web and is not open.
  Future<Box> openHiveBox({required String boxName}) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName))
      Hive.init((await getApplicationDocumentsDirectory()).path);

    return await Hive.openBox(boxName);
  }

  /// Put key/value to box.
  Future<void> put({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    try {
      Box<dynamic> bx = await openHiveBox(boxName: boxName);

      return await bx.put(key, value);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  /// Put key/value to box.
  Future<dynamic> get({
    required String boxName,
    required String key,
  }) async {
    try {
      Box<dynamic> bx = await openHiveBox(boxName: boxName);

      return bx.get(key);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
