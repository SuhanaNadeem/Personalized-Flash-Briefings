import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashed/screens/home/explore.dart';
import 'package:flashed/screens/home/profile.dart';
import 'package:flashed/screens/home/topics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Topics(),
    Explore(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {

    final profiles = Provider.of<QuerySnapshot>(context);
    //print(profiles.documents);
    if (profiles != null){
      for (var doc in profiles.documents) {
        print(doc.data);
      }
    }

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Topics"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: new Text("Explore"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.portrait),
            title: new Text("Profile"),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}