import 'package:anex/Screens/auth_page.dart';
import 'package:anex/Screens/login_screen.dart';
import 'package:anex/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AneX());
}

class AneX extends StatelessWidget {
  const AneX({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 2000)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
                debugShowCheckedModeBanner: false, home: Splash());
          } else {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: AuthPage(),
            );
          }
        });
  }
}
