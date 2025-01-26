import 'package:banking/pages/homepage.dart';
import 'package:banking/pages/splash.dart';
import 'package:flutter/material.dart';
import 'onboarding/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
