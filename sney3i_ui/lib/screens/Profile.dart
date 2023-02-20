
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserLogin.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final Future<SharedPreferences> _prefs= SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(

              width: 50,
              height: 100,
              child: ElevatedButton(

                  onPressed: ()async{
                  final SharedPreferences? prefs = await _prefs ;
                  prefs?.clear();
                  Get.offAll(()=>UserLogin());
                  },
                child: Text("Log Out", style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
