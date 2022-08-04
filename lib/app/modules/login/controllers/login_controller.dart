import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/local/preference/preference_manager.dart';
import 'package:tree_plantation_mobile/app/data/model/request/login_request.dart';
import 'package:tree_plantation_mobile/app/data/model/response/user_profile.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository.dart';
import 'package:tree_plantation_mobile/app/log.dart';
import 'package:tree_plantation_mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository =
      Get.find(tag: (AuthRepository).toString());
  PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoginSuccessful = RxBool(false);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void login() {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    LoginRequest loginRequest = LoginRequest(email, password);
    var loginResponse = _authRepository.login(loginRequest);
    loginResponse.then((value) async {
      _setSharedPreferenceValue(value);
    });
  }

  void _setSharedPreferenceValue(dynamic value) {
    _preferenceManager.setString(
        PreferenceManager.accessToken, value.accessToken!);
    _preferenceManager.setString(
        PreferenceManager.refreshToken, value.refreshToken!);
    dynamic access = _preferenceManager.getString("accessToken");
    dynamic refresh = _preferenceManager.getString("refreshToken");
    Log.debug("Token saved in preference manager");
    Log.debug("Access token : $access");
    Log.debug("Refresh token : $refresh");
    isLoginSuccessful(true);
    getProfile();
  }

  void clearSharedPreferenceValue() {
    _preferenceManager.remove(PreferenceManager.accessToken);
    _preferenceManager.remove(PreferenceManager.refreshToken);
  }

  void _goToHomeView() {
    if (isLoginSuccessful.isTrue) {
      Get.toNamed(Routes.HOME);
    }
  }

  void getProfile() async {
    UserProfile? profile = await _authRepository.userProfile();
    if (profile.detail?.id != null) {
      saveDataInPreferenceManager(profile);
      _goToHomeView();
    }
    _printData();
  }

  void saveDataInPreferenceManager(UserProfile profile) {
    _preferenceManager.setString(
        PreferenceManager.email, profile.detail!.email.toString());
    _preferenceManager.setString(
        PreferenceManager.name, profile.detail!.name.toString());
    _preferenceManager.setString(
        PreferenceManager.userId, profile.detail!.id.toString());
    Log.debug("Profile saved in Preference manager");
  }

  void _printData() async {
    String n = await _preferenceManager.getString(PreferenceManager.name);
    String e = await _preferenceManager.getString(PreferenceManager.email);
    String i = await _preferenceManager.getString(PreferenceManager.userId);
    Log.debug("Fetching user profile from preference");
    Log.debug("name : $n");
    Log.debug("email : $e");
    Log.debug("id : $i");
  }
}
