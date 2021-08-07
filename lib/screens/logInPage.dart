import 'package:flutter/material.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/widgets/buttonWidget.dart';
import 'package:tikwebapptask/widgets/textFieldWidget.dart';

class LogInPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        title: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 20,
            ),
            textRoboto("Back", Colors.blue, fontSize: 16)
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            //height: size.height,
            //width: size.width,
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: crossAxisAlignmentStart,
                    children: [
                      textRoboto("Login", kBlackColor, fontSize: 30, fontWeight: weight500),
                      size10,
                      textRoboto("Enter your email address and password to access your account", kBlackColor.withOpacity(0.3),
                          fontSize: 18, fontWeight: weight400, maxLine: 3),
                      SizedBox(
                        height: size.height / 8,
                      ),
                      TextFieldWidget(
                        controller: _emailController,
                        hintText: "Email",
                        inputType: TextInputType.emailAddress,
                        isSuffix: false,
                      ),
                      size15,
                      TextFieldWidget(
                        controller: _passController,
                        hintText: "Password",
                        inputType: TextInputType.text,
                        isSuffix: true,
                        suffixWidget: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility),
                          color: kBlackColor.withOpacity(0.3),
                        ),
                      ),
                      size30,
                      ButtonWidget(
                        size: size,
                        btnText: "LogIn",
                        callback: () {},
                      ),


                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Row(
                mainAxisAlignment: mainAxisAlignmentCenter,
                children: [
                  textRoboto(
                    "Don't have an account?",kBlackColor.withOpacity(0.4),fontSize: 18.0,fontWeight: weight400
                  ),
                  textRoboto(
                      "Sign Up",Colors.blue,fontSize: 18.0,fontWeight: weight500
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
