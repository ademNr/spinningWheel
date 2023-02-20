


import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sney3i_ui/controllers/Sney3iAuthController.dart';
import 'package:http/http.dart' as http;
import '../api/API.dart';
import '../models/Sney3iModel.dart';

class Sney3iProfileController extends GetxController{

  Sney3iAuth sney3iauth = Get.put(Sney3iAuth());
  Data? sney3i_model;
  RxBool isDataLoading = false.obs;
  @override
  void onInit() {
    getSney3iaById();
    super.onInit();
  }




  void  getSney3iaById() async {
    final prefs = await SharedPreferences.getInstance();
     try{
       isDataLoading(true);
       http.Response response = await http.get(
         Uri.tryParse("${API.baseUrl}api/sney3i/getSney3iById/${sney3iauth.id}")!,
         headers: {
           'content-type' : 'application/json',

         }
       );
       if(response.statusCode == 200){
         var result = jsonDecode(response.body);
         sney3i_model =  Data.fromJson(result);
       }else{
         print("error occured");
       }
     }catch(e){
       print('Error while getting data is $e');
       print('Error while getting data is $e');
     }finally{
       isDataLoading(false);
     }

   }








}