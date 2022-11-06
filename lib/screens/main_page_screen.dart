import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kiosk/screens/profile_screen.dart';

import '../const.dart';
import './event_list_screen.dart';
import './profile_screen.dart';
import './add_post_screen.dart';

class MainPageScreen extends StatefulWidget {
  MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  List<Widget> screenList = [
    EventListScreen(),
    AddPostScreen(),
    ProfileScreen(),
    
  ];
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    navigationhandler(int index) {
      switch (index) {
        case 0:
          setState(() {
            screenIndex = 0;
          });
          break;
        case 1:
          setState(() {
            screenIndex = 1;
          });
          break;
        case 2:
          setState(() {
            screenIndex = 2;
          });
      }
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: navigationhandler,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 40,
                  color: Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                  size: 40,
                  color: Colors.white,
                ),
                label: ""),
          ],
        ),
        body: screenList[screenIndex]);
  }
}
