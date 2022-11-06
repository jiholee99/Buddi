import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/exit_button_widget.dart';

import '../const.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/main_background.jpg"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              // Main Area
              Flexible(
                  flex: 10,
                  child: Container(
                    //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                                      "Category",
                                      style: titleTextStyle.copyWith(fontSize: 30, color: Colors.white),
                                    )),
                                    
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 6,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              side: BorderSide(),
                                              textStyle: defaultTextStyle,
                                              primary: Colors.grey[400],
                                              fixedSize: Size(300, 50)),
                                          onPressed: () {},
                                          child: Text(
                                            "Social",
                                            style: defaultTextStyle,
                                          )),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              side: BorderSide(),
                                              textStyle: defaultTextStyle,
                                              primary: Colors.grey[400],
                                              fixedSize: Size(300, 50)),
                                          onPressed: () {},
                                          child: Text(
                                            "Education",
                                            style: defaultTextStyle,
                                          )),
                                      ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  side: BorderSide(),
                                                  textStyle: defaultTextStyle,
                                                  primary: Colors.grey[400],
                                                  fixedSize: Size(300, 50)),
                                              onPressed: () {},
                                              child: Text("Sports/Workout", style: defaultTextStyle,)),
                                      ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  side: BorderSide(),
                                                  textStyle: defaultTextStyle,
                                                  primary: Colors.grey[400],
                                                  fixedSize: Size(300, 50)),
                                              onPressed: () {},
                                              child: Text("Recreation", style: defaultTextStyle,)),
                                      ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  side: BorderSide(),
                                                  textStyle: defaultTextStyle,
                                                  primary: Colors.grey[400],
                                                  fixedSize: Size(100, 50)),
                                              onPressed: () {},
                                              child: Text("All", style: defaultTextStyle,)),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
