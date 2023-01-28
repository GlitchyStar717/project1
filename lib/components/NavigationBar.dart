import 'package:anex/Screens/home_page.dart';
import 'package:anex/Screens/setting_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../Screens/phone_recommendation.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final _pages = [
    HomePage(),
    PhoneRecommendation(),
    Container(color: Colors.brown),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECF0F1),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xFFFBDC3C7),
        color: Color(0xFFECF0F1),
        items: <Widget>[
          Image.asset('assets/png/HomeButton.png'),
          Image.asset('assets/png/PhoneRec.png'),
          Image.asset('assets/png/SupportIcon.png'),
          Image.asset('assets/png/settings.png'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
