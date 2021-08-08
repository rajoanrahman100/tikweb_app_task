import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/responsive.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/signUpController.dart';
import 'logInPage.dart';
import 'package:tikwebapptask/widgets/buttonWidget.dart';
import 'package:tikwebapptask/widgets/dialog.dart';
import 'package:tikwebapptask/widgets/textFieldWidget.dart';

class SignInPage extends StatelessWidget {
  static const routeName = 'signup_page';

  var signUpController = Get.put(SignUpController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();

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
          onTap: () => Navigator.pop(context),
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
              height: size.height,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: crossAxisAlignmentStart,
                      children: [
                        textRoboto("Sign Up", kBlackColor, fontSize: 30, fontWeight: weight500),
                        size20,
                        Obx(() => Stack(
                          alignment: Alignment.center,
                          children: [
                            signUpController.profileImagePath.value == ""
                                ? Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black),
                                  image: new DecorationImage(
                                    image: new ExactAssetImage('images/profile.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ))
                                : Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(File(signUpController.profileImagePath.value)),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 100.0, right: 50.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new CircleAvatar(
                                      backgroundColor: kBlackColor,
                                      radius: 20.0,
                                      child: new IconButton(
                                          onPressed: () {
                                            Dialogs.pickImageDialog(context, size, signUpController);
                                          },
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: kWhiteColor,
                                            size: 20,
                                          )),
                                    )
                                  ],
                                )),
                          ],
                        )),
                        size30,
                        TextFieldWidget(
                          controller: nameController,
                          hintText: "Name",

                          inputType: TextInputType.name,
                          isSuffix: false,
                        ),
                        size10,
                        TextFieldWidget(
                          controller: emailController,
                          hintText: "Email",
                          type: "email",
                          inputType: TextInputType.emailAddress,
                          isSuffix: false,
                        ),
                        size10,
                        Obx(() => TextFieldWidget(
                            controller: passController,
                            hintText: "Password",
                            type: "password",
                            inputType: TextInputType.emailAddress,
                            isSuffix: true,
                            suffixWidget: IconButton(
                              onPressed: () {
                                signUpController.showPass.value = !signUpController.showPass.value;
                              },
                              icon: signUpController.showPass.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                              color: kBlackColor.withOpacity(0.3),
                            ),
                            isObsecure: !signUpController.showPass.value)),
                        size10,
                        TextFieldWidget(
                          controller: phoneController,
                          hintText: "Mobile Number",
                          inputType: TextInputType.number,
                          isSuffix: true,
                          suffixWidget: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: textRoboto("Verify", Colors.blue, fontWeight: weight500),
                          ),
                        ),
                        size20,
                        textRoboto("Gender", kBlackColor, fontSize: 20, fontWeight: weight400),
                        Row(
                          children: [
                            textRoboto("Male", kBlackColor, fontSize: 20, fontWeight: weight400),
                            Obx(
                                  () => Radio(
                                value: 'Male',
                                activeColor: kBlackColor,
                                groupValue: signUpController.selectedGender.value,
                                onChanged: (value) {
                                  signUpController.selectedGender.value = value.toString();
                                  signUpController.genderValue.value = "1";
                                  print(signUpController.genderValue.value);
                                  print(signUpController.selectedGender.value);
                                },
                              ),
                            ),
                            textRoboto("Female", kBlackColor, fontSize: 20, fontWeight: weight400),
                            Obx(
                                  () => Radio(
                                value: 'Female',
                                activeColor: kBlackColor,
                                groupValue: signUpController.selectedGender.value,
                                onChanged: (value) {
                                  signUpController.selectedGender.value = value.toString();
                                  signUpController.genderValue.value = "2";
                                  print(signUpController.genderValue.value);
                                },
                              ),
                            )
                          ],
                        ),
                        size20,
                        ButtonWidget(
                          size: size,
                          btnText: "SignUp",
                          callback: () {
                            if (_formKey.currentState == null || _formKey.currentState!.validate()) {

                              if(signUpController.profileImagePath.value.isEmpty){
                                showSnackBar(context: context,message: "Select Photo");
                                return;
                              }else{
                                signUpController.signUpUser(
                                    File(signUpController.profileImagePath.value),
                                    nameController.text,
                                    emailController.text,
                                    signUpController.genderValue.value,
                                    phoneController.text,
                                    passController.text,
                                    context);
                              }

                            }

                            //Navigator.pushNamed(context, BottomNavBarPage.routeName);
                          },
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
                    textRoboto("Already have an account?", kBlackColor.withOpacity(0.4),
                        fontSize: 18.0, fontWeight: weight400),
                    GestureDetector(onTap: ()=>Navigator.pushNamed(context, LogInPage.routeName),child: textRoboto("Login", Colors.blue, fontSize: 18.0,
                        fontWeight:
                        weight500)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
