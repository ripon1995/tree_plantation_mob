import 'package:flutter/material.dart';

Widget customTextField(String data, IconData icon, int maxLen,
    TextEditingController textEditingController) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      controller: textEditingController,
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
