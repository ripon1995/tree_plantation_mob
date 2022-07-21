import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tree_plantation_mobile/app/modules/home/controllers/home_controller.dart';

Widget profileInfo() {
  HomeController _controller = Get.find();
  _controller.getProfileName();
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Row(
      children: [
        InkWell(
            child: CircleAvatar(backgroundColor: Colors.blue, radius: 30),
            onTap: () {
              print("Tapped");
            }),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Good Morning!",
                  style: GoogleFonts.lato(
                    fontSize: 17,
                    color: Colors.black,
                  )),
              Text(
                _controller.name.value,
                style: GoogleFonts.lato(fontSize: 22),
              )
            ],
          ),
        )
      ],
    ),
  );
}
