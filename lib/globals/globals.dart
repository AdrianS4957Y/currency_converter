import 'package:flutter/material.dart';

const mainBackgroundColor = Color(0xFFF6F6F6);

class Calculator {
  static double height(BuildContext context, num number) =>
      MediaQuery.of(context).size.height * number / 703;
  static double width(BuildContext context, num number) =>
      MediaQuery.of(context).size.height * number / 360;
}
