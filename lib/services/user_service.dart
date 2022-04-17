import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/model/user_model.dart';

class UserService extends GetxService {
  /// Users collection reference.
  final CollectionReference _usersDB =
      FirebaseFirestore.instance.collection('users');

  /// Data collection reference.
  final CollectionReference _dataDB =
      FirebaseFirestore.instance.collection('data');

  /// Create a user.
  Future<void> createUser({required UserModel user}) async {
    try {
      // Create batch instance.
      final WriteBatch batch = FirebaseFirestore.instance.batch();

      // Create document reference of user.
      final DocumentReference userDocRef = _usersDB.doc(user.deviceID);

      // Set the user data to the document reference.
      batch.set(
        userDocRef,
        user.toJson(),
      );

      // Create document reference of tableCounts.
      final DocumentReference tableCountsDocRef = _dataDB.doc('tableCounts');

      // Update the user account on the table counts document.
      batch.update(tableCountsDocRef, {'users': FieldValue.increment(1)});

      // Execute batch.
      await batch.commit();
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  /// Retrieve a user.
  Future<UserModel> retrieveUser({required String uid}) async {
    try {
      final DocumentReference model = await _usersDB
          .doc(uid)
          .withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => model.toJson());

      return (await model.get()).data() as UserModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Update a user.
  Future<void> updateUser({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      data['modified'] = DateTime.now().toUtc();
      await _usersDB.doc(uid).update(data);
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
