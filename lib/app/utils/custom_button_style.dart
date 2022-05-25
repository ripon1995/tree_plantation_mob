import 'package:flutter/material.dart';

ButtonStyle customOutlinedButtonStyle(Color color,double elevation,double w,double h) {
  return OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      backgroundColor: color,
      elevation: elevation,
      minimumSize: Size(w, h),
      padding: EdgeInsets.all(5)
  );
}