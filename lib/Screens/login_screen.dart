import 'package:anex/Screens/auth_page.dart';
import 'package:anex/components/square_tile.dart';
import 'package:anex/components/textfield.dart';
import 'package:anex/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Text Editing Controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //Sign User In Method
  void SignUserIn() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    //sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      WrongEmailMessage(e.code);
    }
    //pop the loading circle
    Navigator.pop(context);
  }

  //error message
  void WrongEmailMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('message'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECF0F1),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Image.asset("assets/png/Splash_logo.png"),

                const SizedBox(height: 30),

                //welcome
                Text(
                  'Welcome back, You\'ve been missed!',
                  style: TextStyle(
                    color: Color(0xFFFBDC3C7),
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 25),
                //username textfield
                Textfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                //password textfield
                Textfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                //forget password?

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //signin button
                Button(
                  text: 'Sign In',
                  onTap: SignUserIn,
                ),

                const SizedBox(height: 15),

                //or continue with

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color(0xFFFBDC3C7),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Continue With',
                        style: TextStyle(color: Color(0xFFFBDC3C7)),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color(0xFFFBDC3C7),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                //google + fb buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'assets/png/google.png',
                    ),

                    //Gap
                    const SizedBox(
                      width: 25,
                    ),

                    //fb button
                    SquareTile(
                      onTap: (() {}),
                      imagePath: 'assets/png/fb.png',
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
