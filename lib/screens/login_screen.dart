import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kiosk/const.dart';

import '../resources/firebase_auth_methods.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    void loginHandler() async {
      String result = await FirebaseAuthMethods().login(emailTextController.text, passwordTextController.text);
      if (result == "success") {
        Navigator.of(context).popAndPushNamed(mainPageRouteName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result),
          duration: Duration(seconds: 1),
        ));
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/welcome_background.jpg"), fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
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
                          height: 380,
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
                                flex: 4,
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
                                          style: usernameTextStyle.copyWith(fontSize: 25, color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          controller: emailTextController,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey,
                                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Password",
                                          style: usernameTextStyle.copyWith(fontSize: 25, color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          controller: passwordTextController,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey,
                                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                            child: ElevatedButton(
                                                style:
                                                    ElevatedButton.styleFrom(primary: Colors.grey[400], fixedSize: Size(110, 40)),
                                                onPressed: loginHandler,
                                                child: Text(
                                                  "Log in",
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
      ),
    );
  }
}
