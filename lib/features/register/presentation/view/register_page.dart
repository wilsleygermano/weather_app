// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/widgets/generic_text_button.dart';
import 'package:weather_app/core/widgets/generic_text_field.dart';
import 'package:weather_app/core/widgets/password_text_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:weather_app/features/register/presentation/controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Modular.get<RegisterController>();
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
                      ? Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                        )
                      : Icon(Icons.visibility_off_outlined,
                          color: Colors.white),
                  iconButtonPressed: _controller.setPasswordVisibility,
                );
              }),
              Observer(builder: (_) {
                return PasswordTextField(
                  hintText: "Confirm Your Password",
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icons.key_outlined,
                  onChanged: _controller.changePasswordConfirmation,
                  isTexObscure: _controller.isPasswordConfirmationVisible,
                  suffixIconButton: _controller.isPasswordConfirmationVisible
                      ? Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                        )
                      : Icon(Icons.visibility_off_outlined,
                          color: Colors.white),
                  iconButtonPressed:
                      _controller.setPasswordConfirmationVisibility,
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GenericTextButton(
                      buttonPressed: () => Navigator.pop(context),
                      buttonText: "GO BACK"),
                  GenericTextButton(
                      buttonPressed: () async {
                        await _controller.registerUser(context);
                      },
                      buttonText: "REGISTER")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
