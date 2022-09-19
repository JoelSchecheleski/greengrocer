import 'package:flutter/material.dart';

Map<int, Color> _swatOpacity = {
  50 : const Color.fromRGBO(78, 136, 27, .1),
  100 : const Color.fromRGBO(78, 136, 27, .2),
  200 : const Color.fromRGBO(78, 136, 27, .3),
  300 : const Color.fromRGBO(78, 136, 27, .4),
  400 : const Color.fromRGBO(78, 136, 27, .5),
  500 : const Color.fromRGBO(78, 136, 27, .6),
  600 : const Color.fromRGBO(78, 136, 27, .7),
  700 : const Color.fromRGBO(78, 136, 27, .8),
  800 : const Color.fromRGBO(78, 136, 27, .9),
  900 : const Color.fromRGBO(78, 136, 27, 1)
};

abstract class CustomColors {
  static Color customContrastColor = Colors.red.shade700;
  static MaterialColor customSwatchColor = MaterialColor(0xFF4E881B, _swatOpacity);
}