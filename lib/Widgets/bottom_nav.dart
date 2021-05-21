import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market/Screens/All%20Category/all_category.dart';
import 'package:market/Screens/constants.dart';
import 'package:market/Screens/home/home_screen.dart';
import 'package:market/Screens/profile/profile.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _currentIndex = 0;


  final List<Widget> _children = [
    HomeScreen(),
    AllCategory(),
    ProfileMain(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
            // backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: new Image.asset("assets/icons/cate2.png"),
              title: new Text('All Category'),
              backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.redAccent)
        ],
      ),
    );
  }
}
