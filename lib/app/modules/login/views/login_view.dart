import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:tree_plantation_mobile/app/routes/app_pages.dart';
import 'package:tree_plantation_mobile/app/utils/custom_button_style.dart';
import 'package:tree_plantation_mobile/app/utils/custom_text_field.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 400,
                child: Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset("assets/images/app_logo.svg")),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customTextField("username", Icons.person_outlined, 20),
              customTextField("password", Icons.lock_outline, 20),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: customOutlinedButtonStyle(Colors.black, 10, 300, 50),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Not Registered?",
                style: TextStyle(color: Colors.black45, fontSize: 15),
              ),
              OutlinedButton(
                onPressed: () {
                  Get.toNamed(Routes.SIGNUP);
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white),
                ),
                style: customOutlinedButtonStyle(Colors.pink, 2, 100, 20),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
