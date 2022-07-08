import 'package:flutter/material.dart';

Widget allTree(String imageLink) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    color: Colors.white70,
    child: SizedBox(
      height: 200,
      width: 200,
      child: Container(
        child: Image.asset(imageLink),
        height: 50,
        width: 50,
      ),
    ),
  );
}
