import 'package:get/get.dart';
import 'package:simon_says_hope/model/user_model.dart';

import '../services/firestore_service.dart';

class UserRepository extends GetxService {
  /// Collection title, 'users'.
  final String _collection = 'users';

  /// Firestore service.
  final FirestoreService _firestoreService = Get.find();

  /// Create a user.
  Future<void> createUser({required UserModel user}) async {
    try {
      // Create documentn via firestore service.
      await _firestoreService.createDocument(
        collection: _collection,
        data: user.toJson(),
        documentID: user.uid,
      );

      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  /// Return all users.
  Future<List<UserModel>> retrieveUsers() async {
    try {
      List<UserModel> users =
          (await _firestoreService.retrieveDocuments(collection: _collection))!
              .map((e) => e.data() as UserModel)
              .toList();

      return users;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
