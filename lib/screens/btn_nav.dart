// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:second_project/screens/home.dart';
import 'package:second_project/screens/sett.dart';
import 'package:second_project/screens/stor.dart';

class BtnNav extends StatefulWidget {
  @override
  State<BtnNav> createState() => _BtnNavState();
}

class _BtnNavState extends State<BtnNav> {
  int ind = 0;

  List<Widget> screens = [Home(), Stor(), Sett()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ind,
        onTap: (value) {
          setState(() {
            ind = value;
          });

        },
         selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: '*'),
          BottomNavigationBarItem(icon: Icon(Icons.store),label: '*'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: '*'),

        ],
      ),

      body:screens[ind] ,
    );
  }
}
