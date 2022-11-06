import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

import '../const.dart';
import '../resources/firestore_methods.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController titleTextController = TextEditingController();

  TextEditingController capacityTextController = TextEditingController();

  TextEditingController DescriptionTextController = TextEditingController();

  List<DropdownMenuItem> categoryItems = [
    DropdownMenuItem(
        value: 0,
        child: Row(
          children: [
            Text("🎉"),
            Text(
              "Social",
              style: defaultTextStyle,
            ),
          ],
        )),
    DropdownMenuItem(
        value: 1,
        child: Row(
          children: [
            Text("📖"),
            Text(
              "Education",
              style: defaultTextStyle,
            ),
          ],
        )),
    DropdownMenuItem(
        value: 2,
        child: Row(
          children: [
            Text("🏋️"),
            Text(
              "Sports/Workout",
              style: defaultTextStyle,
            ),
          ],
        )),
    DropdownMenuItem(
        value: 3,
        child: Row(
          children: [
            Text("🌱"),
            Text(
              "Recreation",
              style: defaultTextStyle,
            ),
          ],
        )),
  ];
  int categoryIndex = 0;

  void createEvent() async{
    String icon = "";
    switch (categoryIndex) {
      case 0:
        icon = "social";
        break;
      case 1:
        icon = "education";
        break;
      case 2:
        icon = "sport/workout";
        break;
      case 3:
        icon = "recreation";
        break;
    }
    String title = titleTextController.text;

    int capacity = int.parse(capacityTextController.text);
    String description = DescriptionTextController.text;
    String creationTime = DateTime.now().toIso8601String();
    String result = await FirestoreMethods().createEvent(title, icon, capacity, description, creationTime);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result),duration: Duration(seconds:1),));
  }

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
                                    color: Color.fromARGB(255, 6, 77, 184),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Center(
                                            child: Text(
                                          "Create a post",
                                          style: titleTextStyle.copyWith(fontSize: 30, color: Colors.white),
                                        )),
                                        Positioned(
                                            right: 5,
                                            top: 7,
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: RawMaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero,
                                                    side: BorderSide(width: 2, color: Colors.black)),
                                                fillColor: Colors.grey[400],
                                                onPressed: () {},
                                                child: Text(
                                                  "X",
                                                  style: defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ))
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
                                            "Title",
                                            style: usernameTextStyle.copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: TextField(
                                                controller: titleTextController,
                                                decoration: InputDecoration(
                                                    filled: true, fillColor: Colors.grey[400], border: OutlineInputBorder())),
                                          ),
                                          Text(
                                            "Icon",
                                            style: usernameTextStyle.copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: DropdownButton(
                                                isExpanded: true, items: categoryItems, value: categoryIndex, onChanged: null),
                                          ),
                                          Text(
                                            "Capacity",
                                            style: usernameTextStyle.copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: TextField(
                                                keyboardType: TextInputType.number,
                                                controller: capacityTextController,
                                                decoration: InputDecoration(
                                                    filled: true, fillColor: Colors.grey[400], border: OutlineInputBorder())),
                                          ),
                                          Text(
                                            "Description",
                                            style: usernameTextStyle.copyWith(color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: TextField(
                                                controller: DescriptionTextController,
                                                decoration: InputDecoration(
                                                    filled: true, fillColor: Colors.grey[400], border: OutlineInputBorder())),
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  textStyle: defaultTextStyle,
                                                  primary: Colors.grey[400],
                                                  fixedSize: Size(100, 30)),
                                              onPressed: () {},
                                              child: Text(
                                                "Photos",
                                                style: defaultTextStyle,
                                              )),
                                          Center(
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    textStyle: defaultTextStyle,
                                                    primary: Colors.grey[400],
                                                    fixedSize: Size(120, 50)),
                                                onPressed: createEvent,
                                                child: Text(
                                                  "Post",
                                                  style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
                                                )),
                                          ),
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
