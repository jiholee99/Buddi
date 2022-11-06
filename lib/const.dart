import 'package:flutter/material.dart';

var titleTextStyle = const TextStyle(fontFamily: "W95FA", fontSize: 48, fontWeight: FontWeight.bold);
var defaultTextStyle = const TextStyle(fontFamily: "W95FA", fontSize: 20, color: Colors.black);
var buttonTextStyle = const TextStyle(fontFamily: "W95FA", fontSize: 40);

var usernameTextStyle = const TextStyle(fontSize: 20, fontFamily: "W95FA", fontWeight: FontWeight.bold, color: Colors.white);

var mainScreenTitleTextStyle =
    const TextStyle(fontSize: 60, fontFamily: "W95FA", fontWeight: FontWeight.bold, color: Colors.white);

const Color topBlueColor = Color.fromARGB(255, 6, 77, 184);

String loginPageRouteName = '/login';
String mainPageRouteName = '/main-page';
String signupPageRouteName = './sign-up';
String profilePageRouteName = './profile';
String categoryPageRouteName = './category';

List<DropdownMenuItem<int>> genderList = [
  DropdownMenuItem(
    child: Text(
      "Male",
      style: usernameTextStyle.copyWith(color: Colors.black),
    ),
    value: 0,
  ),
  DropdownMenuItem(
    child: Text(
      "Female",
      style: usernameTextStyle.copyWith(color: Colors.black),
    ),
    value: 1,
  ),
  DropdownMenuItem(
    child: Text(
      "Others",
      style: usernameTextStyle.copyWith(color: Colors.black),
    ),
    value: 2,
  ),
];
