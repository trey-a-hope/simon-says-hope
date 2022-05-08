import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {

  /// Create document.
  Future<void> create({
    required String collection,
    required Map data,
    String? documentID,
  }) async {
    try {
      // Create collection reference.
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(collection);

      // Create document reference.
      DocumentReference documentReference;
      if (documentID == null) {
        documentReference = collectionReference.doc();
        data['id'] = documentReference.id;
      } else {
        documentReference = collectionReference.doc(documentID);
      }

      // Assign doc ref with user data.
      documentReference.set(data);

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
