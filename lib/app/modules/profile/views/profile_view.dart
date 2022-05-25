import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import '../../../utils/custom_text_field.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
                  customTextField("mobile", Icons.phone_android_outlined, 11),
                  customTextField("email", Icons.email_outlined, 20),
                  customTextField("password", Icons.password_outlined, 20),
                  customElevatedButton("Next!"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
