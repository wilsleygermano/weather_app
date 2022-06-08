import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';

class GenericTextField extends StatelessWidget {
  final String? hintText;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final void Function(String) onChanged;
  final IconData? suffixIconButton;
  final Function()? iconButtonPressed;

  const GenericTextField(
      {Key? key,
      this.hintText,
      required this.textInputAction,
      this.prefixIcon,
      required this.onChanged,
      this.suffixIconButton,
      this.iconButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        style: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          focusColor: Colors.transparent,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            onPressed: iconButtonPressed,
            icon: Icon(
              suffixIconButton,
              color: Colors.white,
            ),
          ),
        ),
      ),
      start: 0.3,
      end: 0.1,
      borderRadius: 10,
    );
  }
}
