import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/responsive.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/locationController.dart';
import 'authPages/logInPage.dart';
import 'authPages/signInPage.dart';
import 'package:tikwebapptask/widgets/buttonWidget.dart';

class LandingPage extends StatelessWidget {

  var locationController=Get.put(LocationController());

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: Responsive(
          mobile: Stack(
            children: [
              Image.asset("images/back.jpg",height: size.height,width: size.width,fit: BoxFit.cover,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                height: size.height,
                width: size.width,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: crossAxisAlignmentCenter,
                  children: [
                    Expanded(flex:2,child: Container()),
                    textRoboto("TestMe", kWhiteColor,fontSize: 50,fontWeight: FontWeight.w500),
                    size5,
                    Container(
                      width: size.width/1.8,
                      padding: EdgeInsets.all(7.0),
                      decoration: containerBoxDecoration(
                          color: kBlackColor,borderRadius: 5.0
                      ),
                      child: Center(
                        child:textRoboto("USER AUTHENTICATION", kWhiteColor,fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ),
                    size30,
                    ButtonWidget(size: size,btnText: "LogIn",callback: (){
                      Navigator.pushNamed(context,LogInPage.routeName);
                    },),
                    size10,
                    ButtonWidget(size: size,btnColor: kWhiteColor,btnText: "SignUp",textColor: kBlackColor,callback: (){
                      Navigator.pushNamed(context,SignInPage.routeName);
                    },),
                    Expanded(flex:1,child: Container())
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

