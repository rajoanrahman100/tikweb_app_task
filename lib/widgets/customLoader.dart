import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TikWebLoader {

  static Widget? showLoaderAnimation({context,String? textBottom}){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Material(
            color: Colors.transparent,
            child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.transparent,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/rolling.gif",height: 100.0,width: 100.0,),
                    // Text(textBottom,style: TextStyle(color: colorTextBottom,fontSize: 18,),maxLines: 1,)
                  ],
                )
            ),
          );
        },
        useSafeArea: true);
  }
  static hideTikWebLoader(context){
    Navigator.of(context,rootNavigator: true).pop();
  }
}
