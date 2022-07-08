import 'package:flutter/material.dart';

Widget allTreeSingleItem(String imageLink) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    color: Colors.white70,
    child: Image.asset(imageLink),
  );
}
