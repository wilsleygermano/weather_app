import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/features/register/domain/use_cases/register_with_mail_and_password_use_case.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
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


  @observable
  String passwordConfirmation = '';

  @action
  void changePasswordConfirmation(String newValue) =>
      passwordConfirmation = newValue;

@observable
  bool isPasswordConfirmationVisible = true;

  @action
  void setPasswordConfirmationVisibility() => isPasswordConfirmationVisible = !isPasswordConfirmationVisible;


  @computed
  bool get isPasswordValid =>
      password.length > 4 && password == passwordConfirmation;
      

  

  @action
  Future registerUser(BuildContext context) async {
    final _defaultRegisterUseCase =
        Modular.get<RegisterWithMailAndPasswordUseCase>();
    await _defaultRegisterUseCase.registerUser(email, password, context);
    await Modular.to.pushNamed('/favorites/');
  }
}
