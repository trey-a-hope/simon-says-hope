import 'package:get/get.dart';
import 'package:simon_says_hope/repositories/feeling_repository.dart';
import 'package:simon_says_hope/repositories/user_repository.dart';
import 'package:simon_says_hope/services/auth_service.dart';
import 'package:simon_says_hope/services/firestore_service.dart';
import 'package:simon_says_hope/services/validation_service.dart';

class InitialBinding implements Bindings {
  void dependencies() {
    Get.lazyPut(() => AuthService(), fenix: true);
    Get.lazyPut(() => FirestoreService(), fenix: true);
    Get.lazyPut(() => FeelingRepository(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => ValidationService(), fenix: true);
  }
}
