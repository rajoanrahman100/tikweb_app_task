import 'package:flutter/material.dart';
import 'package:tikwebapptask/screens/bottomBarItems/addUserScreen.dart';
import 'package:tikwebapptask/screens/bottomNavBar.dart';
import 'package:tikwebapptask/screens/landingPage.dart';
import 'package:tikwebapptask/screens/logInPage.dart';
import 'package:tikwebapptask/screens/signInPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}


