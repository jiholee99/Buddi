import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../const.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list, size: 40), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add, size: 40), label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                size: 40,
              ),
              label: ""),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Title
            Flexible(
                flex: 2,
                child: Container(
                  color: Colors.green,
                  child: Stack(children: [
                    Center(
                        child: Text(
                      "Buddi",
                      style: titleTextStyle,
                    )),
                    Positioned(
                      right: 20,
                      child: CircleAvatar(foregroundImage: AssetImage("assets/buddiicon.jpg"),))
                  ]),
                )),
            // Main Area
            Flexible(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  color: Colors.blue,
                  child: Container(
                    color: Colors.grey,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
