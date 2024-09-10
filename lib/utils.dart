// utils.dart

import 'package:flutter/material.dart';

// Colors
const orange = Color(0xffFC6E2A);
const lightOrange = Color(0xffFFD27C);
const black = Color(0xff181C2E);
const white = Color(0xffFFFFFF);
const lightBlack = Color(0xff676767);
const boxColor = Color(0xff98A8B8);
const search = Color(0xffF6F6F6);
const lightBox = Color(0xffD0D9E1);

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
    fontFamily: 'Sen'
  ),
  );
}