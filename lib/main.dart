import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
