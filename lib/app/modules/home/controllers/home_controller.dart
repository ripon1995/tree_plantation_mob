import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tree_plantation_mobile/app/data/local/preference/preference_manager.dart';
import 'package:tree_plantation_mobile/app/data/model/request/profile_details_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/user_profile.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth-repo/auth_repository.dart';
import 'package:tree_plantation_mobile/app/data/repository/profile-detail-repo/profile_detail_repository.dart';
import 'package:tree_plantation_mobile/app/log.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository =
      Get.find(tag: (AuthRepository).toString());
  final ProfileDetailRepository _profileDetailRepository =
      Get.find(tag: (ProfileDetailRepository).toString());
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  RxString name = "".obs;
  RxInt id = 0.obs;
  RxString profileImageDownloadUrl = "".obs;
  Rxn<File> chosenImage = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getProfileId() {
    id(_preferenceManager.getInt(PreferenceManager.userId));
  }

  @override
  void onClose() {}

  void getProfileData() {
    _fetchCustomerProfile();

    if(_preferenceManager.getBool(PreferenceManager.profileDetailsCreated)) {
      _fetchCustomerProfileDetails();
    }
  }

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
      chosenImage.value = File(image.path);

      return true;
    } on PlatformException catch (e) {
      Log.debug('Failed to pick image: $e');

      return false;
    }
  }

  Future uploadProfilePicture() async {
    String downloadUrl="";
    Log.debug("Uploading in firebase....");
    final imagesRef = FirebaseStorage.instance.ref().child(
        "profile_image/${_preferenceManager.getString(PreferenceManager.name)}");
    File file = File(chosenImage.value!.path);
    try {
      await imagesRef.putFile(file);
      downloadUrl = await imagesRef.getDownloadURL();
      Log.debug(downloadUrl);
      Log.debug("Uploading done in firebase....");
      _showSnackMessage("Wow!", "Profile image changed successfully");
      _preferenceManager.getBool(PreferenceManager.profileDetailsCreated)
          ? _updateProfileDetails(downloadUrl)
          : _createProfileDetails(downloadUrl);
    } on FirebaseException catch (e) {
      _showSnackMessage("Oops!", "Please try again...");
      Log.debug("Uploading failed in firebase...");
      Log.debug("Error : $e");
    }
  }

  Future<void> _createProfileDetails(String downloadUrl) async {
    Log.debug("Creating profile detail...");
    ProfileDetailRequest profileDetailRequest =
        ProfileDetailRequest(downloadUrl);
    await _profileDetailRepository
        .createProfileDetail(profileDetailRequest)
        .then((value) {
      _preferenceManager.setInt(
          PreferenceManager.userDetailId, value.data!.id!);
      _preferenceManager.setBool(PreferenceManager.profileDetailsCreated, true);
      Log.debug("Creating profile detail done...");
      _fetchCustomerProfileDetails();
    });

  }

  Future<void> _updateProfileDetails(String downloadUrl) async {
    Log.debug("Updating profile detail...");
    ProfileDetailRequest profileDetailRequest =
        ProfileDetailRequest(downloadUrl);
    int userDetailId =
        _preferenceManager.getInt(PreferenceManager.userDetailId);
    await _profileDetailRepository.updateProfileDetail(
        profileDetailRequest, userDetailId);
    Log.debug("Updaing profile detail done");
    _fetchCustomerProfileDetails();
  }

  void _showSnackMessage(String title,String message) {
    Get.snackbar(title, message);
  }

  void _fetchCustomerProfile() {
    Log.debug("Fetching profile data...");
    _getProfile();
  }


  void _fetchCustomerProfileDetails() {
    Log.debug("Fetching profile details...");
    _getProfileDetails();
  }

  void _getProfile() async {
    UserProfile? profile = await _authRepository.userProfile();
    if (profile.detail?.id != null) {
      _saveProfileInSharedPreference(profile);
      Log.debug("Fetching profile data done...");
    }
    else {
      Log.debug("Fetching profile data is failed...");
    }
  }

  void _saveProfileInSharedPreference(UserProfile profile) {
    _preferenceManager.setString(
        PreferenceManager.email, profile.detail!.email.toString());
    _preferenceManager.setString(
        PreferenceManager.name, profile.detail!.name.toString());
    name(profile.detail!.name.toString());
    _preferenceManager.setInt(PreferenceManager.userId, profile.detail!.id!);
    Log.debug("Profile saved in Preference manager successfully...");
  }

  void _getProfileDetails() async {
    int id = _preferenceManager.getInt(PreferenceManager.userDetailId);
    await _profileDetailRepository.fetchProfileDetail(id).then((response) {
      profileImageDownloadUrl(response.data!.profile_picture_link);
      Log.debug("Fetching profile details done...");
    });
  }

  void _printData() async {
    String n = await _preferenceManager.getString(PreferenceManager.name);
    String e = await _preferenceManager.getString(PreferenceManager.email);
    int i = await _preferenceManager.getInt(PreferenceManager.userId);
    Log.debug("Fetching user profile from preference");
    Log.debug("name : $n");
    Log.debug("email : $e");
    Log.debug("id : $i");
  }

}
