import 'package:get/get.dart';
import 'package:flutter/material.dart';


class ImagePicKBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Welcome'),
        content: Text('GeeksforGeeks'),
      actions: [
        FlatButton(           // FlatButton widget is used to make a text to work like a button
          textColor: Colors.black,
          onPressed: () {},        // function used to perform after pressing the button
          child: Text('CANCEL'),
        ),
        FlatButton(
          textColor: Colors.black,
          onPressed: () {},
          child: Text('ACCEPT'),
        ),
      ],
      );
  }
}
