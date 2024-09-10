import 'package:currency_converter/globals/enum_colors.dart';
import 'package:flutter/material.dart';

double _fontSizeMultiplier = 1;
setFontSizeMultiplier(double multiplier) {
  _fontSizeMultiplier = multiplier;
}

class Fonts {
  static Map<EColors, Color> colors = {
    EColors.grey: const Color(0xFF989898),
    EColors.blue: const Color(0xFF26278D),
    EColors.darkBlue: const Color(0xFF1F2261),
    EColors.black: Colors.black,
  };
  static roboto({
    Color? color = Colors.white,
    EColors? eColor,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    double? fontSizeMultiplier,
  }) =>
      TextStyle(
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
        fontSize: fontSize * (fontSizeMultiplier ?? _fontSizeMultiplier),
        color: colors[eColor] ?? color,
      );
}
