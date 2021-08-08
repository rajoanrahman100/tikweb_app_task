import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/color_config.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/controller/addUserController.dart';
import 'package:tikwebapptask/widgets/buttonWidget.dart';
import 'package:tikwebapptask/widgets/dialog.dart';
import 'package:tikwebapptask/widgets/textFieldWidget.dart';

class AddUserScreen extends StatelessWidget {
  var addUserController = Get.put(AddUserController());

  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kWhiteColor,
        centerTitle: true,
        title: textRoboto("User List", kBlackColor, fontWeight: weight500),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: crossAxisAlignmentStart,
              children: [
                Obx(() => Stack(
                      alignment: Alignment.center,
                      children: [
                        addUserController.profileImagePath.value == ""
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
                                        image: FileImage(File(addUserController.profileImagePath.value)),
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
                                        Dialogs.pickImageDialog(context, size, addUserController);
                                        // pickImageDialog(context, size);
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
                size15,
                TextFieldWidget(
                  hintText: "Email",
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  isSuffix: false,
                ),
                size15,
                Obx(() => TextFieldWidget(
                    hintText: "Password",
                    controller: passController,
                    inputType: TextInputType.emailAddress,
                    isSuffix: true,
                    suffixWidget: IconButton(
                      onPressed: () {
                        addUserController.showPass.value = !addUserController.showPass.value;
                      },
                      icon: addUserController.showPass.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      color: kBlackColor.withOpacity(0.3),
                    ),
                    isObsecure: !addUserController.showPass.value)),
                size15,
                TextFieldWidget(
                  controller: phoneController,
                  hintText: "Phone",
                  inputType: TextInputType.number,
                  isSuffix: false,
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
                        groupValue: addUserController.selectedGender.value,
                        onChanged: (value) {
                          addUserController.selectedGender.value = value.toString();
                          print(addUserController.selectedGender.value);
                        },
                      ),
                    ),
                    textRoboto("Female", kBlackColor, fontSize: 20, fontWeight: weight400),
                    Obx(
                      () => Radio(
                        value: 'Female',
                        activeColor: kBlackColor,
                        groupValue: addUserController.selectedGender.value,
                        onChanged: (value) {
                          addUserController.selectedGender.value = value.toString();
                        },
                      ),
                    )
                  ],
                ),
                size20,
                ButtonWidget(
                  size: size,
                  btnText: "Save",
                  callback: () {
                    addUserController.addUserData(File(addUserController.profileImagePath.value),nameController.text, emailController.text, "29.09202", "90"
                    ".123233", "1", phoneController.text, passController.text,context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
