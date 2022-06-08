import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginUserDataSource {
  Future loginUserDataSource(String email, String password);
}

class FirebaseLoginUserDataSource implements LoginUserDataSource {
  @override
  Future loginUserDataSource(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
