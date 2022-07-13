import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/local/preference/preference_manager.dart';
import 'package:tree_plantation_mobile/app/data/model/request/login_request.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository.dart';
import 'package:tree_plantation_mobile/app/log.dart';

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
      setSharedPreferenceValue(value);
    });
  }

  void setSharedPreferenceValue(dynamic value) async {
    await _preferenceManager.setString(
        PreferenceManager.accessToken, value.accessToken!);
    await _preferenceManager.setString(
        PreferenceManager.refreshToken, value.refreshToken!);
    dynamic access = await _preferenceManager.getString("accessToken");
    dynamic refresh = await _preferenceManager.getString("refreshToken");
    Log.debug("Token saved in preference manager");
    Log.debug("Access token : $access");
    Log.debug("Refresh token : $refresh");
    isLoginSuccessful(true);
  }

  void clearSharedPreferenceValue() async {
    await _preferenceManager.remove(PreferenceManager.accessToken);
    await _preferenceManager.remove(PreferenceManager.refreshToken);
  }
}
