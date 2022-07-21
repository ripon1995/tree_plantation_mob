import 'package:flutter/material.dart';

Widget allTreeSingleItem(String imageLink) {
  const color = const Color(0xfffaf9ff);
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    color: color,
    child: Image.asset(imageLink),
  );
}
