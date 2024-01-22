import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final ImagePicker picker = ImagePicker();

  XFile? pickImage;

  Reference storage = FirebaseStorage.instance.ref();

  Future<String?> uploadImage(String uid) async {
    Reference storageRef = storage.child('$uid.png');
    File file = File(pickImage!.path);

    try {
      // Dapatkan ekstensi dari nama file
      String fileExtension = file.path.split('.').last.toLowerCase();

      // Set metadata sesuai dengan ekstensi file
      SettableMetadata metadata =
          SettableMetadata(contentType: 'image/$fileExtension');

      // Upload file dengan metadata yang disetel
      await storageRef.putFile(file, metadata);

      // Dapatkan URL unduhan HTTPS
      final photoUrl = await storageRef.getDownloadURL();

      // Reset gambar atau lakukan tindakan lain yang diperlukan
      resetImage();

      // Kembalikan URL unduhan HTTPS
      return photoUrl;
    } catch (error) {
      // Tangani kesalahan selama pengunggahan atau pengambilan URL
      debugPrint("Error uploading image: $error");
      return null;
    }
  }

  void resetImage() {
    pickImage = null;
    update();
  }

  void selectImage() async {
    try {
      final dataImage = await picker.pickImage(source: ImageSource.gallery);
      if (dataImage != null) {
        debugPrint(dataImage.name);
        debugPrint(dataImage.path);
        pickImage = dataImage;
        update();
      }
    } catch (err) {
      debugPrint(err.toString());
      pickImage = null;
      update();
    }
  }
}
