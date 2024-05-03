import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tree_plantation_mobile/app/log.dart';
import 'package:tree_plantation_mobile/app/modules/home/controllers/home_controller.dart';

Widget profileInfo() {
  HomeController _controller = Get.find();
  _controller.getProfileData();
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Row(
      children: [
        Obx(() {
          return InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 32,
                child: CircleAvatar(
                  backgroundImage: _controller
                          .profileImageDownloadUrl.value.isNotEmpty
                      ? NetworkImage(_controller.profileImageDownloadUrl.value)
                      : Image.asset("assets/images/default_profile.png").image,
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
              ),
              onTap: () {
                _controller.getFromGallery().then((value) {
                  if (value) {
                    Log.debug(_controller.chosenImage.value!.path.toString());
                    _controller.uploadProfilePicture();
                  }
                });
              });
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
              Obx(() {
                return Text(
                  _controller.name.value,
                  style: GoogleFonts.lato(fontSize: 22),
                );
              })
            ],
          ),
        )
      ],
    ),
  );
}
