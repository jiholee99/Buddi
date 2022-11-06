import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kiosk/resources/firestore_methods.dart';
import 'package:kiosk/screens/category_screen.dart';
import 'package:kiosk/widgets/exit_button_widget.dart';

import '../const.dart';

class EventListScreen extends StatelessWidget {
  const EventListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget eventWidget(String title, String icon, String description, String creationTime, int capacity) {
      String emoji = "";
      switch (icon) {
        case "social":
          emoji = "🎉";
          break;
      }
      return Container(
        height: 100,
        decoration: BoxDecoration(color: Colors.grey[500], border: Border.all()),
        child: Column(
          children: [
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(flex: 1, child: Text(emoji)),
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Text(title),
                  ),
                ),
                Flexible(flex: 1, child: Text("Capacity : "+capacity.toString()))
              ],
            )),
            Divider(),
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(flex: 1, child: Text("15 min ago")),
                Flexible(
                  flex: 2,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Join now"),
                    ),
                  ),
                ),
                Flexible(flex: 1, child: Container())
              ],
            )),
          ],
        ),
      );
    }

    void showCategory() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => CategoryScreen(),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/main_background.jpg"), fit: BoxFit.cover)),
        child: SafeArea(
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
                                      "Events",
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
                                                borderRadius: BorderRadius.zero, side: BorderSide(width: 2, color: Colors.black)),
                                            fillColor: Colors.grey[400],
                                            onPressed: showCategory,
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
                                    child: StreamBuilder(
                                      stream: FirebaseFirestore.instance.collection("events").snapshots(),
                                      builder: ((context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                                        if (snapshot.connectionState == ConnectionState.active) {
                                          print(snapshot.data!.docs);
                                          return ListView.builder(
                                              itemCount: snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
                                                var element = snapshot.data!.docs[index];
                                                return eventWidget(element['title'], element['icon'], element['description'],
                                                    element['creationTime'], element['capacity']);
                                              });
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      }),
                                    ))),
                          ],
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
