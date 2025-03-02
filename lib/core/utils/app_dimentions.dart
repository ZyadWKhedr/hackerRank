import 'package:flutter/material.dart';

class AppDimensions {
  final double screenWidth;
  final double screenHeight;

  AppDimensions(BuildContext context)
      : screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;

  double height(double percentage) => screenHeight * percentage;
  double width(double percentage) => screenWidth * percentage;
  double fontSize(double percentage) => screenWidth * percentage;
  double radius(double percentage) => screenWidth * percentage;
  double iconSize(double percentage) => screenWidth * percentage;
}
