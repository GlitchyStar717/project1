import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF0F1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
              height: 50,
              decoration: BoxDecoration(color: Colors.red),
              child: Row(
                children: [
                  Image.asset("assets/png/anex.png"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
