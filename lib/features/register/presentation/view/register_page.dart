import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/widgets/glassmorphism.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC2AFEC),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 ,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("lib/assets/logo.png"),
                  ),
                ),
              ),
              GlassMorphism(child: TextField(), start: 0.3, end: 0.1,)
            ],
          ),
        ),
      ),
    );
  }
}
