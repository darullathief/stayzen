import 'package:flutter/material.dart';
import 'package:stayzen/profil.dart';
import 'package:stayzen/riwayat.dart';

import 'Home.dart';

class MyBottomAppBar extends StatefulWidget {
  @override
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            color: _currentIndex == 0 ? Colors.blue : Colors.grey,
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.assignment),
            color: _currentIndex == 1 ? Colors.blue : Colors.grey,
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderHistoryPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            color: _currentIndex == 2 ? Colors.blue : Colors.grey,
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
    );
  }
}
