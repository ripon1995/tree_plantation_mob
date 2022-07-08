import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tree_plantation_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:tree_plantation_mobile/app/modules/home/widgets/allTree.dart';
import 'package:tree_plantation_mobile/app/modules/home/widgets/profile_info.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            profileInfo(),
            SizedBox(height: 20,),
            Container(child: Text("All Trees",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 30)),alignment: Alignment.topLeft,margin: EdgeInsets.only(left: 20),),
            allTree("assets/images/test-image.png"),
          ],
        ),
      ),
    );
  }
}
