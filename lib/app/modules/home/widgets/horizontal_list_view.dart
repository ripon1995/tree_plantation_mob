import 'package:flutter/material.dart';
import 'package:tree_plantation_mobile/app/modules/home/widgets/all_tree_single_item.dart';



Widget horizontalListView() {
  double marginSpace = 2;
  Widget horizontalList = new Container(
    margin: EdgeInsets.all(10.0),
    height: 250.0,
    child: new ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(margin: EdgeInsets.all(marginSpace),child: allTreeSingleItem("assets/images/test-image.png"),),
        Container(margin: EdgeInsets.all(marginSpace),child: allTreeSingleItem("assets/images/test-image.png"),),
        Container(margin: EdgeInsets.all(marginSpace),child: allTreeSingleItem("assets/images/test-image.png"),),
        Container(margin: EdgeInsets.all(marginSpace),child: allTreeSingleItem("assets/images/test-image.png"),),
        Container(margin: EdgeInsets.all(marginSpace),child: allTreeSingleItem("assets/images/test-image.png"),),
        Container(margin: EdgeInsets.all(marginSpace),child: allTreeSingleItem("assets/images/test-image.png"),),
      ],
    ),
  );
  return horizontalList;
}