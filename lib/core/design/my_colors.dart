import 'package:flutter/material.dart';

class MyColors {
  static const Color backgroundcolor = Color(0xFFC2AFEC);
  static const Color primarywhite = Colors.white;
  static BoxDecoration gradientCard = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.white.withOpacity(0.4),
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.1),
          ]));
}
