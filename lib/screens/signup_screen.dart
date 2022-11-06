import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../const.dart';
import '../model/event.dart';
import '../resources/firebase_auth_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailTextContorller = TextEditingController();
  TextEditingController passwordTextContorller = TextEditingController();
  int gender_index_value = 0;
  @override
  Widget build(BuildContext context) {
    void singupHandler() async {
      String result = await FirebaseAuthMethods().signUp(emailTextContorller.text, passwordTextContorller.text);
      if (result == "success") {
        Navigator.of(context).pushReplacementNamed(mainPageRouteName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result),duration: Duration(seconds:1),));
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage("assets/welcome_background.jpg"), fit: BoxFit.cover)),
          child: SafeArea(
            child: Column(children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    //color: Colors.green,
                    child: Center(
                        child: Text(
                      "[ Buddi ]",
                      style: titleTextStyle,
                    )),
                  )),
              Flexible(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      //color: Colors.blue,
                      width: double.infinity,
                      // Log in card
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 600,
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Color.fromARGB(255, 2, 2, 167),
                                child: Stack(children: [
                                  Center(
                                      child: Text(
                                    "Welcome",
                                    style: TextStyle(fontFamily: "W95FA", fontSize: 20, color: Colors.white),
                                  )),
                                  Positioned(
                                      right: 10,
                                      top: 15,
                                      child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: RawMaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero,
                                                    side: BorderSide(width: 2, color: Colors.black)),
                                                fillColor: Colors.grey[400],
                                                onPressed: ()=>Navigator.of(context).pop(),
                                                child: Text(
                                                  "X",
                                                  style: defaultTextStyle.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ))
                                ]),
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                width: double.infinity,
                                //color: Colors.grey,
                                child: Container(
                                  //color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email",
                                        style: usernameTextStyle.copyWith(fontSize: 20, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextField(
                                          controller: emailTextContorller,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey,
                                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Password",
                                        style: usernameTextStyle.copyWith(fontSize: 20, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextField(
                                          controller: passwordTextContorller,
                                          style: TextStyle(fontSize: 15),
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey,
                                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Gender",
                                        style: usernameTextStyle.copyWith(fontSize: 20, color: Colors.black),
                                      ),
                                      // Dropdown
                                      DropdownButton(
                                          isExpanded: true,
                                          dropdownColor: Colors.grey[400],
                                          value: gender_index_value,
                                          items: genderList,
                                          onChanged: (int? newValue) {
                                            //set value
                                            setState(() {
                                              gender_index_value = newValue!;
                                            });
                                          }),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Center(
                                          child: ElevatedButton(
                                              style:
                                                  ElevatedButton.styleFrom(primary: Colors.grey[400], fixedSize: Size(110, 40)),
                                              onPressed: singupHandler,
                                              child: Text(
                                                "Sign up",
                                                style: usernameTextStyle.copyWith(fontSize: 20, color: Colors.black),
                                              )))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
            ]),
          ),
        ),
      ),
    );
  }
}
