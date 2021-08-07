import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/signUpController.dart';
import 'package:tikwebapptask/widgets/buttonWidget.dart';
import 'package:tikwebapptask/widgets/dialog.dart';
import 'package:tikwebapptask/widgets/textFieldWidget.dart';

class SignInPage extends StatelessWidget {
  var signUpController = Get.put(SignUpController());

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
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: SingleChildScrollView(
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
                                          Dialogs.pickImageDialog(context,size,signUpController);
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
                    hintText: "Name",
                    inputType: TextInputType.name,
                    isSuffix: false,
                  ),
                  size10,
                  TextFieldWidget(
                    hintText: "Email",
                    inputType: TextInputType.emailAddress,
                    isSuffix: false,
                  ),
                  size10,
                  Obx(() => TextFieldWidget(
                      hintText: "Password",
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
                          },
                        ),
                      )
                    ],
                  ),
                  size20,
                  ButtonWidget(
                    size: size,
                    btnText: "SignUp",
                    callback: () {},
                  ),
                ],
              ),
            ),
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
                  textRoboto("Login", Colors.blue, fontSize: 18.0, fontWeight: weight500),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> pickImageDialog(BuildContext context, Size size) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: size.height / 6,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  size10,
                  textRoboto("Upload Profile Picture", kBlackColor, fontSize: 20.0, fontWeight: FontWeight.w500),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      signUpController.getProfileImage(ImageSource.camera, context);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: kGreyColor.withOpacity(0.2)),
                          child: Center(
                            child: Icon(
                              Icons.camera,
                              color: kBlackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        textRoboto("From Camera", kBlackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      signUpController.getProfileImage(ImageSource.gallery, context);
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: kGreyColor.withOpacity(0.2)),
                          child: Center(
                            child: Icon(
                              Icons.perm_media,
                              color: kBlackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        textRoboto("From Gallery", kBlackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
