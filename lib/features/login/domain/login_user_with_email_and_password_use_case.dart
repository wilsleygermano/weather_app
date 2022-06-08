import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/features/login/data/data_sources/login_user_data_source.dart';

abstract class LoginUserWithEmailAndPasswordUseCase {
  Future loginUser(String email, String password, BuildContext context);
}

class DefaultLoginUseCase implements LoginUserWithEmailAndPasswordUseCase {
  @override
  Future loginUser(String email, String password, BuildContext context) async {
    final _loginUserDataSource = Modular.get<LoginUserDataSource>();
    await _loginUserDataSource.loginUserDataSource(email, password);
    debugPrint("User: ${FirebaseAuth.instance.currentUser!.uid}");
  }
}
