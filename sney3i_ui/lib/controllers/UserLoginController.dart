import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../api/API.dart';
import '../screens/UserBottomNavigation.dart';
import '../screens/HomePage.dart';
class UserLoginController extends GetxController{

final Future<SharedPreferences> _prefs= SharedPreferences.getInstance();


Future<void> loginUser(TextEditingController emailController,TextEditingController passwordController )async{
  var headers= {'content-type' :'application/json'};
  try{
    var url = Uri.parse("${API.baseUrl}api/user/login");
    Map body ={
      'email' : emailController.text.trim(),
      'password' : passwordController.text
    };

    http.Response response = await http.post(url,body:jsonEncode(body), headers: headers);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      var token = json;
      print(token);
      final SharedPreferences? prefs = await _prefs ;
      await prefs?.setString('authtoken', token) ;
      Get.to(()=>BottomNavigation());
      print("Connected");


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
    print(e);

  }
}
}