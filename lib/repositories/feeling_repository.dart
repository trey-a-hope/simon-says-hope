import 'package:cloud_firestore/cloud_firestore.dart';
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
      await _firestoreService.createDocument(
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

  Future<List<FeelingModel>> getFeelingsForMonth(
      {required DateTime date}) async {
    try {
      // Retrieve documents between a date range.
      List<QueryDocumentSnapshot<Object?>> queryDocumentSnapshots =
          await _firestoreService.retrieveDocumentsBetweenDateRange(
        collection: 'feelings',
        key1: 'created',
        val1: DateTime.now().subtract(Duration(days: 7)),
        key2: 'created',
        val2: DateTime.now().add(
          Duration(days: 7),
        ),
      );

      List<Future<DocumentSnapshot<FeelingModel>>> futureDocumentSnapshots =
          queryDocumentSnapshots
              .map((doc) => doc.reference
                  .withConverter<FeelingModel>(
                      fromFirestore: (snapshot, _) =>
                          FeelingModel.fromJson(snapshot.data()!),
                      toFirestore: (model, _) => model.toJson())
                  .get())
              .toList();

      List<FeelingModel> feelings = [];

      for (int i = 0; i < futureDocumentSnapshots.length; i++) {
        DocumentSnapshot<FeelingModel> res = await futureDocumentSnapshots[i];
        feelings.add(res.data()!);
      }

      return feelings;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
