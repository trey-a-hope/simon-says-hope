import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  //Add validation to determine if file is image or not...
  Future<String> uploadImage(
      {required File file, required String imgPath}) async {
    try {
      final Reference ref = FirebaseStorage.instance.ref().child(imgPath);
      final UploadTask uploadTask = ref.putFile(file);
      final Reference sr = (await uploadTask).ref;
      return (await sr.getDownloadURL()).toString();
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  Future<void> deleteImage({required String imgPath}) async {
    try {
      final Reference ref = FirebaseStorage.instance.ref().child(imgPath);
      await ref.delete();
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
