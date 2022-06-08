import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final IconData prefixIcon;
  final void Function(String) onChanged;
  final Icon? suffixIconButton;
  final Function()? iconButtonPressed;
  final bool isTexObscure;

  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.prefixIcon,
    required this.onChanged,
    this.suffixIconButton,
    this.iconButtonPressed,
    required this.isTexObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: GlassMorphism(
        child: TextField(
          obscureText: isTexObscure,
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
              icon: suffixIconButton!,
            ),
          ),
        ),
        start: 0.3,
        end: 0.1,
        borderRadius: 10,
      ),
    );
  }
}
