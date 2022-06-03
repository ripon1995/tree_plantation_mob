import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/data/model/request/sign_up_request.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository.dart';
import 'package:tree_plantation_mobile/app/data/repository/auth_repository_impl.dart';
import 'package:tree_plantation_mobile/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final count = 0.obs;
  RxBool isSignUpSuccessful = false.obs;

  // Text editing controller
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  AuthRepository _authRepository = AuthRepositoryImpl();

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

  void increment() => count.value++;

  // get input values for signup
  void signup() {
    String name = nameController.text.toString();
    String username = usernameController.text.toString();
    String phone = phoneController.text.toString();
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    String repass = retypePasswordController.text.toString();

    SignUpRequest signUpRequest =
        SignUpRequest(name, username, email, phone, password);
    var signUpResponse = _authRepository.signUp(signUpRequest);
    signUpResponse.then((value) {
      // if the registration is successful then it will show the snack bar and navigate to the login page
      if (value.message == "success")
        Get.snackbar("Congratulation", "Registration Successful",
            snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(Routes.LOGIN);
    });
    print(name);
  }
}
