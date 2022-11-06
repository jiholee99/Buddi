import 'package:flutter/material.dart';

var titleTextStyle = const TextStyle(fontFamily: "W95FA", fontSize: 48, fontWeight: FontWeight.bold);

var buttonTextStyle = const TextStyle(fontFamily: "W95FA", fontSize: 40);

var usernameTextStyle = const TextStyle(fontSize: 20, fontFamily: "W95FA", fontWeight: FontWeight.bold, color: Colors.white);

String loginPageRouteName = '/login';
String mainPageRouteName = '/main-page';
String signupPageRouteName = './sign-up';

List<DropdownMenuItem<int>> genderList = [
  DropdownMenuItem(child: Text("Male", style: usernameTextStyle.copyWith(color: Colors.black),), value: 0,),
  DropdownMenuItem(child: Text("Female",style: usernameTextStyle.copyWith(color: Colors.black),), value: 1,),
  DropdownMenuItem(child: Text("Others",style: usernameTextStyle.copyWith(color: Colors.black),), value: 2,),

];
