import 'package:anex/Screens/Login_or_register.dart';
import 'package:anex/Screens/login_screen.dart';
import 'package:anex/components/NavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return NavBar();
          }
          //user is not logged in
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
