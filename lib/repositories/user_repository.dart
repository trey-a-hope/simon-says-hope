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
        collection: _collection, data: user.toJson(), documentID: user.uid,);

      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

// /// Retrieve a user.
// Future<UserModel> retrieveUser({required String uid}) async {
//   try {
//     final DocumentReference model = await _usersDB
//         .doc(uid)
//         .withConverter<UserModel>(
//         fromFirestore: (snapshot, _) =>
//             UserModel.fromJson(snapshot.data()!),
//         toFirestore: (model, _) => model.toJson());
//
//     return (await model.get()).data() as UserModel;
//   } catch (e) {
//     throw Exception(e.toString());
//   }
// }
//
// /// Update a user.
// Future<void> updateUser({
//   required String uid,
//   required Map<String, dynamic> data,
// }) async {
//   try {
//     data['modified'] = DateTime.now().toUtc();
//     await _usersDB.doc(uid).update(data);
//     return;
//   } catch (e) {
//     throw Exception(
//       e.toString(),
//     );
//   }
// }
}
