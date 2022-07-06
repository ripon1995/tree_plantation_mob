import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_plantation_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:tree_plantation_mobile/app/modules/home/widgets/profile_info.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            profileInfo(),
          ],
        ),
      ),
    );
  }
}
