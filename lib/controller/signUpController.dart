import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tikwebapptask/components/apis.dart';
import 'package:tikwebapptask/components/storage.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/model/ApiResponse.dart';
import 'package:tikwebapptask/widgets/customDialog.dart';

class SignUpController extends GetxController{

  Rx<String> selectedGender = 'Male'.obs;
  Rx<String> genderValue="1".obs;

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

  void signUpUser(File? imageFile,name,email,genderValue,phone,password,context)async{

    print("--------Calling------------");

    var result;

    showDialog(
        builder: (context) => CustomLoader(),
        context: context,
        barrierDismissible: false);

    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    var uri = Uri.parse(signUpUserApi);
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);

    if (imageFile != null) {
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile('profile_image', stream, length,
          filename: imageFile.path);
      request.files.add(multipartFile);
    }

    request.fields.addAll({
      "name":name,
      "email":email,
      "latitude":boxStorage.read(USER_LAT),
      "longitude":boxStorage.read(USER_LONG),
      "gender":genderValue,
      "phone":phone,
      "password":password,
      "password_confirmation":password,
    });

    var response = await request.send();

    await response.stream.transform(utf8.decoder).listen((value) {
      result = value;
    });

    if(response.statusCode==200){

      Map<String,dynamic> dataMap=json.decode(result);
      if(dataMap["meta"]["status"]==100){
        Navigator.of(context).pop();
        ApiResponse apiResponse=ApiResponse.fromJson(dataMap);
        showSnackBar(context: context,message: apiResponse.response!.message);
      }else{
        Navigator.of(context).pop();
        ApiResponse apiResponse=ApiResponse.fromJson(dataMap);
        showSnackBar(context: context,message: apiResponse.response!.message);
      }

    }else{
      Navigator.of(context).pop();
      log(await response.stream.bytesToString());
    }


  }


}