import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController{

  Rx<String> selectedGender = 'Male'.obs;

  RxBool showPass=false.obs;

  var profileImagePath="".obs;

  getProfileImage(ImageSource imageSource, BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource,imageQuality: 50);

    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
    }else{
      print("No Image Selected");
    }
  }

}