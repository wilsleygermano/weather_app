import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/core/widgets/generic_text_button.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/features/login/presentation/controller/login_controller.dart';

import '../../../../core/widgets/password_text_field.dart';

class LoginPage extends StatelessWidget {
  final _controller = Modular.get<LoginController>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC2AFEC),
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage("lib/assets/logo.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Observer(builder: (_) {
                  return GenericTextField(
                    hintText: "E-mail",
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.mail_outline,
                    onChanged: _controller.changeEmail,
                  );
                }),
              ),
              Observer(builder: (_) {
                return PasswordTextField(
                  hintText: "Enter your password",
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.key_outlined,
                  onChanged: _controller.changePassword,
                  isTexObscure: _controller.isPasswordVisible,
                  suffixIconButton: _controller.isPasswordVisible
                      ? const Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                        )
                      : const Icon(Icons.visibility_off_outlined,
                          color: Colors.white),
                  iconButtonPressed: _controller.setPasswordVisibility,
                );
              }),
              Observer(builder: (_) {
                return GenericTextButton(
                    buttonPressed: _controller.areCredentialsValid
                        ? () async {
                            await _controller.loginUser(context);
                          }
                        : () {
                            // ignore: avoid_single_cascade_in_expression_statements
                            AwesomeDialog(
                              showCloseIcon: true,
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.BOTTOMSLIDE,
                              title: "Invalid Credentials",
                              titleTextStyle: TextStyle(
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontSize: 16,
                                color: const Color(0xFFC2AFEC),
                                fontWeight: FontWeight.w600,
                              ),
                              desc: "Please, try again",
                              descTextStyle: TextStyle(
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontSize: 16,
                                color: const Color(0xFFC2AFEC),
                                fontWeight: FontWeight.w600,
                              ),
                            )..show();
                          },
                    buttonText: "LOGIN");
              }),
              TextButton(
                onPressed: () async {
                  await Modular.to.pushNamed('/register/');
                                  },
                child: Text(
                  "Need an account? Sign Up",
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
