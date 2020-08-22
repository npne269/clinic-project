import 'package:flutter/material.dart';

Color backgroundColor = Color(0xffe2e9f6);
Color pinkColor = Color(0xffd14c9b);
Color blueColorDark = Color(0xff005991);
Color blueColorLight = Color(0xff0296c2);
Color inActiveColor = Color(0xffACCFE4);
Color headingcolor = Colors.white;

TextStyle lightbluestyle =
    TextStyle(color: blueColorLight, fontSize: 16, fontWeight: FontWeight.w500);

OutlineInputBorder outlineborder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    // topLeft: Radius.circular(10),
    // bottomLeft: Radius.circular(40),
    // bottomRight: Radius.circular(10),
    // topRight: Radius.circular(40)),
    borderSide: BorderSide(color: pinkColor, width: 3),
    gapPadding: 12);

OutlineInputBorder focusborder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    // topLeft: Radius.circular(10),
    // bottomLeft: Radius.circular(40),
    // bottomRight: Radius.circular(10),
    // topRight: Radius.circular(40)),
    borderSide: BorderSide(color: pinkColor, width: 4),
    gapPadding: 12);
