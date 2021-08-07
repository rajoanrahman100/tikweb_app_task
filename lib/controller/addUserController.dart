import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddUserController extends GetxController{
  Rx<String> selectedGender = 'Male'.obs;

  RxBool showPass=false.obs;

  var profileImagePath="".obs;

  getProfileImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource,imageQuality: 50);

    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
      print("from add user");
    }else{
      print("No Image Selected");
    }
  }
}