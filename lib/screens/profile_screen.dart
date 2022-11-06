import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/main_background.jpg"), fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: 700,
              child: Column(
                children: [
                  // Title
                  Flexible(
                      flex: 2,
                      child: Container(
                        //color: Colors.green,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Center(
                              child: Text(
                            "Buddi",
                            style: mainScreenTitleTextStyle,
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/buddiicon.jpg"), fit: BoxFit.fill),
                            ),
                          )
                        ]),
                      )),
                  // Main Area
                  Flexible(
                      flex: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        //color: Colors.blue,
                        child: Container(
                            padding: EdgeInsets.all(3),
                            color: Colors.grey[300],
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: double.infinity,
                                    color: topBlueColor,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Center(
                                            child: Text(
                                          "Profile",
                                          style: titleTextStyle.copyWith(fontSize: 30,color: Colors.white),
                                        )),
                                        Positioned(
                                          right: 5,
                                          top: 7,
                                          child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: RawMaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero, side: BorderSide(width: 2, color: Colors.black)),
                                                fillColor: Colors.grey[400],
                                                onPressed: (){},
                                                child: Text(
                                                  "X",
                                                  style: defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: 9,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name",
                                            style: usernameTextStyle.copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    filled: true, fillColor: Colors.grey[400], border: OutlineInputBorder())),
                                          ),
                                          Text(
                                            "Age",
                                            style: usernameTextStyle.copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    filled: true, fillColor: Colors.grey[400], border: OutlineInputBorder())),
                                          ),
                                          Text(
                                            "Gender",
                                            style: usernameTextStyle.copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    filled: true, fillColor: Colors.grey[400], border: OutlineInputBorder())),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      textStyle: defaultTextStyle,
                                                      primary: Colors.grey[400],
                                                      fixedSize: Size(120, 30)),
                                                  onPressed: () {},
                                                  child: Text("Edit", style: defaultTextStyle,)),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      textStyle: defaultTextStyle,
                                                      primary: Colors.grey[400],
                                                      fixedSize: Size(120, 30)),
                                                  onPressed: () {},
                                                  child: Text("Done", style: defaultTextStyle,)),
                                            ],
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            )),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
