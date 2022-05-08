import 'package:get/get.dart';
import 'package:simon_says_hope/model/feeling_model.dart';

import '../services/firestore_service.dart';

class FeelingRepository extends GetxService {
  /// Firestore service.
  final FirestoreService _firestoreService = Get.find();

  /// Create a feeling.
  Future<void> createFeeling({required FeelingModel feeling}) async {
    try {
      // Create document via firestore service.
      await _firestoreService.create(
        collection: 'feelings',
        data: feeling.toJson(),
      );

      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
