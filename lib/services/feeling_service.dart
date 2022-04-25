import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/model/feeling_model.dart'; 

class FeelingService extends GetxService {
  /// Feelings collection reference.
  final CollectionReference _feelingsDB =
      FirebaseFirestore.instance.collection('feelings');

  /// Create a feeling.
  Future<void> createUser({required FeelingModel feeling}) async {
    try {
      // Create document reference of user.
      final DocumentReference feelingDocRef = _feelingsDB.doc(feeling.id);

      await feelingDocRef.set(feeling.toJson());

      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
