import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customBackButton(String route) {
  return Positioned(
    top: 15,
    left: 15,
    child: FloatingActionButton(
      onPressed: () {
        Get.toNamed(route);
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 22.0,
      ),
      backgroundColor: Colors.white,
    ),
  );
}