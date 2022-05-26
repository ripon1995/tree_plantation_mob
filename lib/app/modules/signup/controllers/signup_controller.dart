import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final count = 0.obs;

  // Text editing controller
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

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
    print(name);
  }
}
