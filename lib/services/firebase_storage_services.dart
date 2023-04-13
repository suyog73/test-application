import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseStorageServices {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: 'error while upload ${e.message}');
      return null;
    }
  }
}

class FirebaseStorageMethods {
  Future<void> deleteFile(fileUrl) async {
    if (fileUrl != '') {
      Reference reference = FirebaseStorage.instance.refFromURL(fileUrl);

      await reference.delete();

      print('File deleted successfully');
    }
  }
}
