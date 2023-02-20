
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sney3i_ui/api/API.dart';

import '../screens/Sney3iTopNavigation.dart';


class Sney3iAuth extends GetxController{

  final Future<SharedPreferences> _prefs= SharedPreferences.getInstance();

          RxString id = "".obs ;


  Future<void> registerSney3i(
      TextEditingController email , TextEditingController password , TextEditingController username ,
      String city, TextEditingController number ,String servicetype,
      TextEditingController bio , TextEditingController spec

      )async{
    try{
      var headers = {'content-type' : 'application/json'};
      var url = Uri.parse("${API.baseUrl}api/sney3i/register");
      Map<String,String> body = {
        'username':username.text.trim().toString(),
        'email': email.text.trim().toString(),
        'password':password.text.trim().toString() ,
        'city': city.toString(),
        'number': number.text.trim().toString(),
        'service_type': servicetype,
        'bio': bio.text.trim().toString(),
        'spec': spec.text.trim().toString()

      };

      http.Response response = await http.post(url , body : jsonEncode(body), headers:headers);

      if(response.statusCode == 200){
        final  json  = jsonDecode(response.body);
        var token = json["token"];
            id.value = json["id"];
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', token);
        Get.to(()=>Sney3iBottomNavigation());
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
  //

  Future<void> loginSney3i(TextEditingController emailController,TextEditingController passwordController )async{
    var headers= {'content-type' :'application/json'};
    try{
      var url = Uri.parse("${API.baseUrl}api/sney3i/login");
      Map<String,String> body ={
        'email' : emailController.text.trim().toString(),
        'password' : passwordController.text.toString()
      };

      http.Response response = await http.post(url,body:jsonEncode(body), headers: headers);
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);
         var  token = json["token"];
              id.value = json["id"];

             print("token : "+ token);
             print("id : "+ id.toString());


        final SharedPreferences? prefs = await _prefs ;
        await prefs?.setString('authtoken', token) ;
        Get.to(()=>Sney3iBottomNavigation());
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