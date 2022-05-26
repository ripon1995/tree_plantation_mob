import 'package:flutter/material.dart';

Widget customTextField(String data, IconData icon, int maxLen) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      maxLength: maxLen,
      decoration: InputDecoration(
        icon: Icon(icon, color: Colors.purple),
        hintText: data,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
      ),
    ),
  );
}
