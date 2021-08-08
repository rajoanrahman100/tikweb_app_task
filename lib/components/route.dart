import 'package:flutter/material.dart';
import 'package:tikwebapptask/screens/bottomNavBar.dart';
import 'package:tikwebapptask/screens/logInPage.dart';
import 'package:tikwebapptask/screens/signInPage.dart';

Map<String, WidgetBuilder> routes={

  LogInPage.routeName:(context)=>LogInPage(),
  SignInPage.routeName:(context)=>SignInPage(),
  BottomNavBarPage.routeName:(context)=>BottomNavBarPage(),

};