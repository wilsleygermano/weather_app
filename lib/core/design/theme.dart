import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/design/my_colors.dart';
ThemeData theme() {
  return ThemeData(
    // fontFamily: GoogleFonts.openSans().fontFamily,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 32,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline2: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 24,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline3: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 20,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline4: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 18,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline5: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      headline6: TextStyle(
        color: MyColors.primarywhite,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    ),
  );
}