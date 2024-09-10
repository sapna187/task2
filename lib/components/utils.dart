// utils.dart
import 'package:flutter/material.dart';

// Colors
const pink = Color(0xffF0B3CD);
const pinkText = Color(0xffE36DA6);
const lightPink = Color(0xffF5B5CF);
const black = Color(0xff181C2E);
const white = Color(0xffFFFFFF);
const blue = Color(0xff262F71);
const dirtyBlue = Color(0xff0098D0);
const lightBlue = Color(0xff80ABDB);
const lightBlack = Color(0xff5C5C5C);

// Sizes
SizedBox gapH(double h) => SizedBox(height: h);
SizedBox gapW(double w) => SizedBox(width: w);

// Widgets
Text customText(text, color, size, weight){
  return Text(text,
  style: TextStyle(
    fontSize: size,
    fontWeight: weight,
    color: color,
    fontFamily: 'Alegreya'
  ),
  );
}
