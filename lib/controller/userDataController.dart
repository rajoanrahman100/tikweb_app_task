import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/apis.dart';
import 'package:tikwebapptask/model/userDataModel.dart';
import 'package:tikwebapptask/netWorkService/networkService.dart';
import 'package:http/http.dart' as http;
import 'package:tikwebapptask/widgets/customDialog.dart';
import 'package:tikwebapptask/widgets/customLoader.dart';

class UserDatController extends GetxController{


  var usersData = UserData().obs;

   RxInt totalUser=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchUser();
  }


  Future deleteUser(userID,context)async{

    TikWebLoader.showLoaderAnimation(context: context);

    var response = await http.get(Uri.parse(deleteUserApi+userID),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if(response.statusCode==200){
      TikWebLoader.hideTikWebLoader(context);
      print(response.body);
      print("success");
    }else{
      TikWebLoader.hideTikWebLoader(context);
      print(response.body);
    }
  }

  Future fetchUser()async{
    try {
      var data = await NetWorkService().getUsers();
      usersData.value=data;
      totalUser.value=usersData.value.response!.userList!.length;

      //print("users data res ${usersData.value.response!.userList![0].name}");

    } catch(e) {
      print(e.toString());
    }
  }
}