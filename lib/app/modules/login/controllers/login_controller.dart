import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/model/request/login_request.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository_impl.dart';
import 'package:tree_plantation_mobile/app/log.dart';

class LoginController extends GetxController {

  AuthRepository _authRepository = AuthRepositoryImpl();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    loginResponse.then((value) {
      Log.debug("Access token : ${value.accessToken}");
      Log.debug("Refresh token : ${value.refreshToken}");
    });
  }
}
