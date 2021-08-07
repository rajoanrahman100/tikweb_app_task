import 'dart:convert';

import 'package:get/get.dart';
import 'package:tikwebapptask/components/apis.dart';
import 'package:tikwebapptask/model/userDataModel.dart';
import 'package:tikwebapptask/netWorkService/networkService.dart';
import 'package:http/http.dart';

class UserDatController extends GetxController{


  var usersData = UserData().obs;

   RxInt totalUser=0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchUser();
  }


  void fetchUser()async{
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