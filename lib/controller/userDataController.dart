import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikwebapptask/components/apis.dart';
import 'package:tikwebapptask/model/userDataModel.dart';
import 'package:tikwebapptask/netWorkService/networkService.dart';
import 'package:http/http.dart' as http;
import 'package:tikwebapptask/widgets/customDialog.dart';

class UserDatController extends GetxController{


  var usersData = UserData().obs;

  RxInt totalUser=0.obs;
  Rx<String> selectedGender = 'Male'.obs;
  Rx<String> genderValue="1".obs;

  RxBool showPass = false.obs;

  var profileImagePath = "".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    print("fetch from");
    fetchUser();
  }


  Future deleteUser(userID,context)async{

    showDialog(
        builder: (context) => CustomLoader(),
        context: context,
        barrierDismissible: false);

    var response = await http.get(Uri.parse(deleteUserApi+userID),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if(response.statusCode==200){
      Navigator.of(context).pop();
      print(response.body);
      print("success");
    }else{
      Navigator.of(context).pop();
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