import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tikwebapptask/components/apis.dart';
import 'package:tikwebapptask/components/style_text.dart';
import 'package:tikwebapptask/model/ApiResponse.dart';
import 'package:tikwebapptask/model/loginUserModel.dart';
import 'package:tikwebapptask/model/userDataModel.dart';
import 'package:tikwebapptask/screens/bottomNavBar.dart';
import 'package:tikwebapptask/widgets/customDialog.dart';

class LogInController extends GetxController {


  var userData=LogInUserModel();

  var userName="".obs;
  var userEmail="".obs;
  var userPhone="".obs;
  var createdDate="".obs;
  var profileImage="".obs;
  var userLat="".obs;
  var userLong="".obs;

  RxBool showPass=false.obs;


  Future logInUser(email, password,context) async {

    showDialog(
        builder: (context) => CustomLoader(),
        context: context,
        barrierDismissible: false);

    var response = await http.post(Uri.parse(loginUserApi), headers: <String, String>{
      'Accept': 'application/json',
    }, body: {
      "email":email,
      "password":password
    });

    if(response.statusCode==200){

      Map<String,dynamic> dataMap=json.decode(response.body);
      if(dataMap["meta"]["status"]==100){
        Navigator.of(context).pop();
        ApiResponse apiResponse=ApiResponse.fromJson(dataMap);
        showSnackBar(context: context,message: apiResponse.response!.message);
      }else{
        Navigator.of(context).pop();
        print(dataMap["response"]["user"]);
        userData=LogInUserModel.fromJson(dataMap);
        userName.value=userData.response!.user!.name!;
        userEmail.value=userData.response!.user!.email!;
        userPhone.value=userData.response!.user!.phone!;
        createdDate.value=userData.response!.user!.createdAt!;
        profileImage.value=userData.response!.user!.profileImage!;
        userLat.value=userData.response!.user!.latitude!;
        userLong.value=userData.response!.user!.longitude!;

        Navigator.pushNamed(context, BottomNavBarPage.routeName);
        print("User Name ${userName.value}");

      }
      print(dataMap);
    }
  }


}
