import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget allTree() {
  return
      Card(
        color: Colors.white70,
        child: SizedBox(
          height: 200,
          width: 200,
          child: Container(child: Image.asset("assets/images/test-image.png"),height: 50,width: 50,),
        ),
      );
}