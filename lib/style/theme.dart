import 'dart:ui';
import 'package:flutter/cupertino.dart';

Color palleteYellow = Color.fromRGBO(252,216,5, 100);
Color palleteGreen = Color.fromRGBO(66,182,66, 100);

class Colors {

  const Colors();

  static const Color loginGradientStart = const Color.fromRGBO(66,182,66, 100);
  static const Color loginGradientEnd = const Color.fromRGBO(252,216,5, 100);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}