import 'package:anex/components/square_tile.dart';
import 'package:anex/components/textfield.dart';
import 'package:anex/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text Editing Controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  //Sign User Up Method
  void SignUserUp() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    //sign up
    try {
      //confirm password == password
      if (confirmpasswordController.text == passwordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //error
        errorMessage("Password doesn't match.");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      errorMessage(e.code);
    }
  }

  //error message
  void errorMessage(String message) {
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
                const SizedBox(height: 25),
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
                //confirm password textfield
                Textfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                //signup button
                Button(
                  text: 'Sign Up',
                  onTap: SignUserUp,
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
                      onTap: () {},
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
                    Text('Already have an account?'),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Log in now',
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
