import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECF0F1),
        body: Align(
            alignment: Alignment(0.0, -0.0),
            child: Image.asset('assets/png/splash_screen.png')));
  }
}
