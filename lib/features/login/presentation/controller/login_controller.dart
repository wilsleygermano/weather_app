import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/features/login/domain/login_user_with_email_and_password_use_case.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid => email.contains("@") && email.length > 4;

  @observable
  String password = '';

  @action
  void changePassword(String newValue) => password = newValue;

  @observable
  bool isPasswordVisible = true;

  @action
  void setPasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @computed
  bool get areCredentialsValid =>
      password.length > 4 && email.contains("@") && email.length > 4;


  @action
  Future loginUser(BuildContext context) async {
    final _defaultLoginUseCase =
        Modular.get<LoginUserWithEmailAndPasswordUseCase>();
    try {
      await _defaultLoginUseCase.loginUser(email, password, context);
      await Modular.to.pushNamed('/favorites/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AwesomeDialog(
          showCloseIcon: true,
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: "User Not Found",
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
      } else if (e.code == 'wrong-password') {
        return AwesomeDialog(
          showCloseIcon: true,
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: "Wrong Password",
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
      }
    }
  }
}
