import 'package:flutter/material.dart';
import 'package:tree_plantation_mobile/app/modules/home/widgets/all_tree_single_item.dart';

Widget horizontalListView(BuildContext context) {
  double marginSpace = 2;
  Widget horizontalList = new Container(
    margin: EdgeInsets.all(10.0),
    height: 250.0,
    child: new ListView.builder(
        itemCount: 100,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(marginSpace),
            child: allTreeSingleItem("assets/images/test-image.png"),
          );
        }),
  );
  return horizontalList;
}
