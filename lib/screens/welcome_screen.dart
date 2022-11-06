import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kiosk/const.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/welcome_background.jpg"), fit: BoxFit.cover)),
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
                flex: 1,
                child: Container(
                    //color: Colors.blue,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(fixedSize: Size(180, 90), primary: Colors.grey),
                          onPressed: () {
                            Navigator.pushNamed(context, loginPageRouteName);
                          },
                          child: Text(
                            "Log in",
                            style: buttonTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(fixedSize: Size(180, 90), primary: Colors.grey),
                          onPressed: () {
                            Navigator.of(context).pushNamed(signupPageRouteName);
                          },
                          child: Text(
                            "Sign up",
                            style: buttonTextStyle,
                          ),
                        ),
                      ],
                    ))),
          ]),
        ),
      ),
    );
  }
}
