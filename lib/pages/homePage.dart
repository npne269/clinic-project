import 'package:clinic_app/Screens/screens.dart';
import 'package:clinic_app/global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    BookPage(),
    CouplePage(),
    PlanPage(),
    DocumentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: backgroundColor,
        selectedItemColor: pinkColor,
        unselectedItemColor: inActiveColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Book'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Couple'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Plan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Docs'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
