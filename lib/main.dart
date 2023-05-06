import 'package:flutter/material.dart';
import 'package:flutter_application/home.dart';
import 'package:flutter_application/login.dart';
import 'package:flutter_application/otp.dart';
import 'package:flutter_application/register.dart';
import 'package:flutter_application/splash_screen.dart';

void main() => runApp(DealsDray());

class DealsDray extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealsDray',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/otp': (context) => OtpVerificationScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
