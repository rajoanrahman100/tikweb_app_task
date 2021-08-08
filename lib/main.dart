import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tikwebapptask/screens/landingPage.dart';

import 'components/route.dart';

void main()async {
  await GetStorage.init();
  runApp(MyApp());

   /*runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp()));*/
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


