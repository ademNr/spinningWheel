

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sney3i_ui/screens/HomePage.dart';

import '../api/API.dart';
import '../screens/UserBottomNavigation.dart';

class UserRegisterController extends GetxController{


final Future<SharedPreferences> _prefs= SharedPreferences.getInstance();


Future<void> registerUser(TextEditingController email , TextEditingController password , TextEditingController username )async{
  try{
    var headers = {'content-type' : 'application/json'};
    var url = Uri.parse("${API.baseUrl}api/user/register");
    Map body = {
      'username' :username.text,
      'email': email.text.trim() ,
      'password':password.text

    };

    http.Response response = await http.post(url , body : jsonEncode(body), headers:headers);

    if(response.statusCode == 200){
      final json  = jsonDecode(response.body);
      var token = json;
      print("token:" + token) ;
      final SharedPreferences? prefs = await _prefs;
      await prefs?.setString('token', token);
      Get.to(()=>BottomNavigation());
      print("connectedw");

    }else{
        throw jsonDecode(response.body);
    }

  }catch(e){

    showDialog(
        context: Get.context!,
        builder: (context){
          return SimpleDialog(
            title: Text("Error"),
            contentPadding:  EdgeInsets.all(20),
            children: [
              Text(e.toString())
            ],
          );
        }
    );
    print(e) ;

  }
}
}