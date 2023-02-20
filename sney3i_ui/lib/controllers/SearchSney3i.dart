

import 'dart:convert';

import 'package:get/get.dart';
import 'package:sney3i_ui/models/Sney3iModel.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../api/API.dart';




class SearchSney3i extends GetxController{
  Sney3iModel? sney3i_model;
  var isDataLoading = false.obs;

  var headers= {'content-type' :'application/json'};



  getAll(String username) async {
    try{
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.tryParse("${API.baseUrl}api/sney3i/getSney3iByName?username=${username}")!,
      );
      if(response.statusCode == 200){
        var result = jsonDecode(response.body);
        sney3i_model =  Sney3iModel.fromJson(result);
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