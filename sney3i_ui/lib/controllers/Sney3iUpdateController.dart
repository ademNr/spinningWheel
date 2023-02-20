
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sney3i_ui/controllers/Sney3iAuthController.dart';

import '../api/API.dart';

class UpdateSney3i extends GetxController {
  Sney3iAuth sney3iAuth = Get.put(Sney3iAuth());


  Future<void> updateSney3iLike(String like, String id) async {
    try {
      var headers = {'content-type': 'application/json'};
      var url = Uri.parse(
          "${API.baseUrl}api/sney3i/update/${id}");
      Map<String, int> body = {
        'like': int.parse(like)
      };
      http.Response response = await http.put(
          url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }



  }
  Future<void> updateSney3iUnlike(String unlike, String id) async {
    try {
      var headers = {'content-type': 'application/json'};
      var url = Uri.parse(
          "http://192.168.2.14:3000/api/sney3i/update/${id}");
      Map<String, int> body = {
        'unlike': int.parse(unlike)
      };
      http.Response response = await http.put(
          url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }



  }
}