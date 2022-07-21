import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tree_plantation_mobile/app/data/local/preference/preference_manager.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository.dart';
import 'package:tree_plantation_mobile/app/log.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository =
      Get.find(tag: (AuthRepository).toString());
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  RxString name = "".obs;
  File? chosenImage;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getProfileName() {
    name(_preferenceManager.getString(PreferenceManager.name));
  }

  @override
  void onClose() {}

  Future<bool> getFromGallery() async {
    try {
      var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (image == null) {
        Log.debug('RETURNED FALSE');

        return false;
      }
      chosenImage = File(image.path);

      return true;
    } on PlatformException catch (e) {
      Log.debug('Failed to pick image: $e');

      return false;
    }
  }

  Future uploadProfilePicture() async {
    final imagesRef = FirebaseStorage.instance.ref().child(
        "profile_image/${_preferenceManager.getString(PreferenceManager.name)}");
    File file = File(chosenImage!.path);
    try {
      await imagesRef.putFile(file);
      String downloadUrl = await imagesRef.getDownloadURL();
      Log.debug(downloadUrl);
    } on FirebaseException catch (e) {
      Log.debug("Error : $e");
    }
  }
}
