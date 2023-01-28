import 'package:anex/Screens/login_screen.dart';
import 'package:anex/Screens/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show login page
  bool showLogin = true;

  //choose between login and register page
  void choosePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(
        onTap: choosePages,
      );
    } else {
      return RegisterPage(
        onTap: choosePages,
      );
    }
  }
}
