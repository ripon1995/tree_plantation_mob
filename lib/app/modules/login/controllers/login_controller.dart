import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/local/preference/preference_manager.dart';
import 'package:tree_plantation_mobile/app/data/model/request/login_request.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth-repo/auth_repository.dart';
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
      await FirebaseAnalytics.instance.logEvent(
        name: "select_content",
        parameters: {
          "content_type": "login_response",
          "item_id": "login-response",
        },
      );
      _setTokenInSharedPreference(value);
    });
  }

  void _setTokenInSharedPreference(dynamic value) {
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
    _goToHomeView();
  }

  void _goToHomeView() {
    if (isLoginSuccessful.isTrue) {
      Get.toNamed(Routes.HOME);
    }
  }

  void logOut() {
    _clearSharedPreferenceValue();
    Get.toNamed(Routes.LOGIN);
  }
  void _clearSharedPreferenceValue() {
    _preferenceManager.remove(PreferenceManager.accessToken);
    _preferenceManager.remove(PreferenceManager.refreshToken);
    _preferenceManager.clear();
  }

  Future<void> testSetCurrentScreen() async {
    await FirebaseAnalytics.instance.setCurrentScreen(
      screenName: 'tree-plantation-login',
      screenClassOverride: 'LoginView',
    );
  }
}
