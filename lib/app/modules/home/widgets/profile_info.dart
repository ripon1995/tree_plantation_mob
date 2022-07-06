import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileInfo() {
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
                "Customer Name",
                style: GoogleFonts.lato(fontSize: 22),
              )
            ],
          ),
        )
      ],
    ),
  );
}
