import 'package:flutter/material.dart';
import 'package:tikwebapptask/screens/bottomBarItems/addUserScreen.dart';
import 'package:tikwebapptask/screens/bottomNavBar.dart';
import '../screens/authPages/logInPage.dart';
import '../screens/authPages/signInPage.dart';

Map<String, WidgetBuilder> routes={

  LogInPage.routeName:(context)=>LogInPage(),
  SignInPage.routeName:(context)=>SignInPage(),
  BottomNavBarPage.routeName:(context)=>BottomNavBarPage(),
  AddUserScreen.routeName:(context)=>AddUserScreen(),

};