import 'package:get/get.dart';
import 'package:simon_says_hope/repositories/feeling_repository.dart';
import 'package:simon_says_hope/repositories/settings_repository.dart';
import 'package:simon_says_hope/repositories/user_repository.dart';
import 'package:simon_says_hope/services/auth_service.dart';
import 'package:simon_says_hope/services/fcm_service.dart';
import 'package:simon_says_hope/services/firestore_service.dart';
import 'package:simon_says_hope/services/hive_service.dart';
import 'package:simon_says_hope/services/modal_service.dart';
import 'package:simon_says_hope/services/storage_service.dart';
import 'package:simon_says_hope/services/validation_service.dart';

class InitialBinding implements Bindings {
  void dependencies() {
    Get.lazyPut(() => AuthService(), fenix: true);
    Get.lazyPut(() => FCMService(), fenix: true);
    Get.lazyPut(() => FirestoreService(), fenix: true);
    Get.lazyPut(() => FeelingRepository(), fenix: true);
    Get.lazyPut(() => HiveService(), fenix: true);
    Get.lazyPut(() => ModalService(), fenix: true);
    Get.lazyPut(() => SettingsRepository(), fenix: true);
    Get.lazyPut(() => StorageService(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => ValidationService(), fenix: true);
  }
}
