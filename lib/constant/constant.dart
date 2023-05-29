import 'package:flutter/material.dart';

Color greenPrimary = const Color(0xFF00926E);
Color bluePrimary = const Color(0xFF0C2461);

const TextStyle myTextStyle = TextStyle(
  fontFamily: 'Cairo',
  color: Colors.grey,
);

TextStyle getTextStyle(double fontSize, Color primaryColor) {
  return myTextStyle.copyWith(
    fontSize: fontSize,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );
}
