import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/model/feeling_model.dart';

import '../services/firestore_service.dart';

class FeelingRepository extends GetxService {
  /// Collection title, 'feelings'.
  final String _collection = 'feelings';

  /// Firestore service.
  final FirestoreService _firestoreService = Get.find();

  /// Create a feeling.
  Future<void> createFeeling({required FeelingModel feeling}) async {
    try {
      // Create document via firestore service.
      await _firestoreService.createDocument(
        collection: _collection,
        data: feeling.toJson(),
      );

      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  /// Return all feelings.

  Future<List<FeelingModel>> retrieveFeelings() async {
    try {
      List<FeelingModel> feelings =
          (await _firestoreService.retrieveDocuments(collection: _collection))!
              .map((e) => e.data() as FeelingModel)
              .toList();

      return feelings;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
