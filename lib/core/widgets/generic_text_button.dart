import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';

class GenericTextButton extends StatelessWidget {
  final Function() buttonPressed;
  final String buttonText;

  const GenericTextButton({
    Key? key,
    required this.buttonPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      start: 0.3,
      end: 0.1,
      child: TextButton(
        onPressed: buttonPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
