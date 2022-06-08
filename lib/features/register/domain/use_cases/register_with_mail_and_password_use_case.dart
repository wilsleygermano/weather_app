import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/register/data/data_sources/register_user_data_source.dart';

abstract class RegisterWithMailAndPasswordUseCase {
  Future registerUser(String email, String password, BuildContext context);
}

class DefaultRegisterUseCase implements RegisterWithMailAndPasswordUseCase {
  @override
  Future registerUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    final _registerDataSource = Modular.get<RegisterUserDataSource>();
    try {
      _registerDataSource.registerUserDataSource(
        email,
        password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return SnackBar(
          content: const Text("Weak Password, try again!"),
          action: SnackBarAction(
              label: "Ok",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }),
        );
      } else if (e.code == 'email-already-in-use') {
        return SnackBar(
          content: const Text("Email already in use!"),
          action: SnackBarAction(
              label: "Ok",
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }),
        );
      }
    }
  }
}
