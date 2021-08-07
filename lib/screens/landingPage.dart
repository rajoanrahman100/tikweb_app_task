import 'package:flutter/material.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/widgets/buttonWidget.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: crossAxisAlignmentCenter,
            mainAxisAlignment: mainAxisAlignmentCenter,
            children: [
              textRoboto("TestMe", kBlackColor,fontSize: 40,fontWeight: FontWeight.w500),
              size5,
              Container(
                width: size.width/2,
                padding: EdgeInsets.all(7.0),
                decoration: containerBoxDecoration(
                  color: kBlackColor,borderRadius: 5.0
                ),
                child: Center(
                  child:textRoboto("USER AUTHENTICATION", kWhiteColor,fontSize: 18,fontWeight: FontWeight.w500),
                ),
              ),
              size30,
              ButtonWidget(size: size,btnText: "LogIn",callback: (){},),
              size10,
              ButtonWidget(size: size,btnColor: kWhiteColor,btnText: "SignUp",textColor: kBlackColor,callback: (){},),
            ],
          ),
        ),
      ),
    );
  }
}

