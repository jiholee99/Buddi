import 'package:flutter/material.dart';
import 'package:kiosk/const.dart';
import 'package:kiosk/screens/category_screen.dart';
import 'package:kiosk/screens/profile_screen.dart';
import './screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import './screens/main_page_screen.dart';

import './screens/login_screen.dart';
import './screens/main_page_screen.dart';
import './screens/welcome_screen.dart';
import './screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
      routes: {
        loginPageRouteName: (context) => const LoginScreen(),
        mainPageRouteName: (context) => MainPageScreen(),
        signupPageRouteName: (context)=> const SignupScreen(),
        profilePageRouteName: (context) => const ProfileScreen(),
        categoryPageRouteName:(context) => const CategoryScreen(),
      },
    );
  }
}

