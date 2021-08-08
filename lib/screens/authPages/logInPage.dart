import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/responsive.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/logInController.dart';
import 'signInPage.dart';
import 'package:tikwebapptask/widgets/buttonWidget.dart';
import 'package:tikwebapptask/widgets/textFieldWidget.dart';

class LogInPage extends StatelessWidget {
  static const routeName = 'login_page';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  var loginController = Get.put(LogInController());

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        title: GestureDetector(
          onTap: ()=>Navigator.pop(context),
          child: Row(
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
      ),
      body: Responsive(
        mobile: Stack(
          children: [
            Container(
              //height: size.height,
              //width: size.width,
              child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: crossAxisAlignmentStart,
                        children: [
                          textRoboto("Login", kBlackColor, fontSize: 30, fontWeight: weight500),
                          size10,
                          textRoboto(
                              "Enter your email address and password to access your account", kBlackColor.withOpacity(0.3),
                              fontSize: 18, fontWeight: weight400, maxLine: 3),
                          SizedBox(
                            height: size.height / 8,
                          ),
                          TextFieldWidget(
                            controller: _emailController,
                            hintText: "Email",
                            type: "email",
                            inputType: TextInputType.emailAddress,
                            isSuffix: false,
                          ),
                          size15,
                          Obx(
                                () => TextFieldWidget(
                              controller: _passController,
                              hintText: "Password",
                              inputType: TextInputType.text,
                              isSuffix: true,
                              type: "password",
                              isObsecure: !loginController.showPass.value,
                              suffixWidget: IconButton(
                                onPressed: () {
                                  loginController.showPass.value = !loginController.showPass.value;
                                },
                                icon:loginController.showPass.value? Icon(Icons.visibility):Icon(Icons.visibility_off),
                                color: kBlackColor.withOpacity(0.3),
                              ),
                            ),
                          ),
                          size30,
                          ButtonWidget(
                            size: size,
                            btnText: "LogIn",
                            callback: () {

                              if(_formKey.currentState==null ||_formKey.currentState!.validate()){
                                FocusScope.of(context).unfocus();
                                print("validate");
                                loginController.logInUser(_emailController.text, _passController.text, context);

                              }

                            },
                          ),
                        ],
                      ),
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
                    textRoboto("Don't have an account?", kBlackColor.withOpacity(0.4),
                        fontSize: 18.0, fontWeight: weight400),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, SignInPage.routeName),
                      child: textRoboto("Sign Up", Colors.blue, fontSize: 18.0, fontWeight: weight500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
