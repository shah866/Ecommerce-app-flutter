import 'package:flutter/widgets.dart';

class Responsive {
  final double screenWidth;
  final double screenHeight;

  Responsive(BuildContext context)
      : screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;

  double imageHeight(double factor) => screenHeight * factor;

  double font(double factor) => screenWidth * factor;

  double padding(double factor) => screenWidth * factor;

  double width(double factor) => screenWidth * factor;

  double height(double factor) => screenHeight * factor;
}
