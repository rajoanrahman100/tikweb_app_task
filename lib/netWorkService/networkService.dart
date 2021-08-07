import 'dart:convert';
import 'dart:developer';

import 'package:tikwebapptask/components/apis.dart';
import 'package:tikwebapptask/model/userDataModel.dart';
import 'package:http/http.dart' as http;

class NetWorkService{

  Future<UserData> getUsers()async{

    final response = await http.get(
      Uri.parse(userApi),
      headers: {
        'Accept': 'application/json',
      },
    );

    if(response.statusCode==200 || response.statusCode==201){
      log(response.body);
      var data=json.decode(response.body);
      return UserData.fromJson(data);
    }else{
      log(response.statusCode.toString());
      throw Exception('Fail to load');
    }

  }
}