import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterUserDataSource {
  Future registerUserDataSource(
    String email,
    String password,
  );
}

class FirebaseRegisterUserDataSource implements RegisterUserDataSource {
  @override
  Future registerUserDataSource(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
