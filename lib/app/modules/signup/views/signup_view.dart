import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/modules/signup/controllers/signup_controller.dart';
import 'package:tree_plantation_mobile/app/routes/app_pages.dart';
import 'package:tree_plantation_mobile/app/utils/custom_back_button.dart';
import 'package:tree_plantation_mobile/app/utils/custom_button_style.dart';
import 'package:tree_plantation_mobile/app/utils/custom_text_field.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
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
                    "Welcome To",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    "Garden",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextField("name", Icons.person, 20),
                  customTextField("username", Icons.person_outlined, 20),
                  customTextField("phone", Icons.phone_android_outlined, 11),
                  customTextField("email", Icons.email_outlined, 20),
                  customTextField("password", Icons.lock_outlined, 20),
                  customTextField("retype password", Icons.repeat, 20),
                  SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: customOutlinedButtonStyle(Colors.black, 10, 300, 50),
                  ),
                ],
              ),
            ),
            customBackButton(Routes.LOGIN),
          ],
        ),
      ),
    ));
  }
}
