import 'package:flutter/material.dart';
import 'package:cssa/pages/community.dart';
import 'package:cssa/pages/campus.dart';
import 'package:cssa/pages/home.dart';
import 'package:cssa/pages/academic.dart';
import 'package:cssa/theme/modes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  bool _showNavigationBar = true;
  ThemeMode _themeMode = ThemeMode.system;

  final List<Widget> _pages = [
    HomePage(),
    AcademicPage(),
    CampusPage(),
    CommunityPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSSA',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: _showNavigationBar
            ? BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                onTap: _onTabTapped,
                selectedItemColor: Color(0xFFCC9900).withOpacity(0.9),
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Academic'),
                  BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Campus'),
                  BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
                ],
              )
            : null,
      ),
    );
  }
}