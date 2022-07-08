import 'package:flutter/material.dart';

Widget allTreeSingleItem(String imageLink) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    color: Colors.white70,
    child: SizedBox(
      height: 250,
      width: 250,
      child: Container(
        child: Image.asset(imageLink),
      ),
    ),
  );
}
