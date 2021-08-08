import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tikwebapptask/screens/bottomBarItems/addUserScreen.dart';
import 'package:tikwebapptask/screens/bottomBarItems/profileScreen.dart';
import 'package:tikwebapptask/screens/bottomNavBar.dart';
import 'package:tikwebapptask/screens/landingPage.dart';
import 'package:tikwebapptask/screens/logInPage.dart';
import 'package:tikwebapptask/screens/signInPage.dart';

import 'components/route.dart';

void main()async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes:routes,
    );
  }
}


