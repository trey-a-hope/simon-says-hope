import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:simon_says_hope/model/feeling_model.dart';
import 'package:simon_says_hope/model/user_model.dart';

class FirestoreService extends GetxService {
  /// Instance of FirebaseFirestore
  static FirebaseFirestore instance = FirebaseFirestore.instance;

  /// The 'feelings' collection table.
  final CollectionReference _feelingsCollection =
  instance.collection('feelings');

  /// The 'users' collection table.
  final CollectionReference _usersCollection = instance.collection('users');

  /// Returns a collection reference specified the collection title.
  CollectionReference? _collectionReference({required String collection}) {
    switch (collection) {
      case 'feelings':
        return _feelingsCollection;
      case 'users':
        return _usersCollection;
      default:
        return null;
    }
  }

  /// Create document.
  Future<void> createDocument({
    required String collection,
    required Map data,
    String? documentID,
  }) async {
    try {
      // Create document reference.
      DocumentReference documentReference;
      if (documentID == null) {
        documentReference = _collectionReference(collection: collection)!.doc();
        data['id'] = documentReference.id;
      } else {
        documentReference =
            _collectionReference(collection: collection)!.doc(documentID);
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

  /// Update document.
  Future<void> updateDocument({
    required String collection,
    required Map<String, Object?> data,
    required documentID,
  }) async {
    try {
      // Fetch document reference.Ï
      DocumentReference documentReference =
      _collectionReference(collection: collection)!.doc(documentID);

      // Update data for this document.
      documentReference.update(data);

      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  /// Retrieve document.
  Future<DocumentSnapshot?> retrieveDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      switch (collection) {
        case 'feelings':
          return (await _feelingsCollection.doc(documentId)
              .withConverter<FeelingModel>(
              fromFirestore: (snapshot, _) =>
                  FeelingModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => model.toJson())
              .get());
        case 'users':
          return (await _usersCollection.doc(documentId)
              .withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => model.toJson())
              .get());
        default:
          return null;
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  /// Retrieve documents.
  Future<List<QueryDocumentSnapshot>?> retrieveDocuments({
    required String collection,
  }) async {
    try {
      switch (collection) {
        case 'feelings':
          return (await _feelingsCollection
              .withConverter<FeelingModel>(
              fromFirestore: (snapshot, _) =>
                  FeelingModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => model.toJson())
              .orderBy('created', descending: true)
              .get())
              .docs;
        case 'users':
          return (await _usersCollection
              .withConverter<UserModel>(
              fromFirestore: (snapshot, _) =>
                  UserModel.fromJson(snapshot.data()!),
              toFirestore: (model, _) => model.toJson())
              .get())
              .docs;
        default:
          return null;
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
