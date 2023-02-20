
import 'dart:convert';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sney3i_ui/controllers/Sney3iAuthController.dart';
import 'package:sney3i_ui/controllers/Sney3iProfileController.dart';
import 'package:sney3i_ui/controllers/Sney3iUpdateController.dart';
import 'package:sney3i_ui/screens/Sney3iLogin.dart';
import 'package:sney3i_ui/screens/Sney3iRegister.dart';

import '../widgets/UserHeaderWidget.dart';
class Sney3iProfile extends StatefulWidget {
  const Sney3iProfile({Key? key}) : super(key: key);

  @override
  State<Sney3iProfile> createState() => _Sney3iProfileState();
}

class _Sney3iProfileState extends State<Sney3iProfile> {
  final Future<SharedPreferences> _prefs= SharedPreferences.getInstance();
  Sney3iProfileController sney3iProfileController = Get.put(Sney3iProfileController());
  UpdateSney3i updateSney3i = Get.put(UpdateSney3i());
  Sney3iAuth sney3iAuth = Get.put(Sney3iAuth());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white.withOpacity(0.5),
        body : Obx(()=>
           SafeArea(
            child: sney3iProfileController.isDataLoading.value? Center(child: CircularProgressIndicator(color: Colors.teal,),)
                :
            ListView(
              children: [
                Container(


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(

                          margin: EdgeInsets.only(top: 10),
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: SizedBox(
                                width: 198,
                                height: 198,
                                child: Stack(
                                  children: [
                                    ClipOval(
                                      child: Image.asset("lib/assets/adem.png", ),

                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 50, top: 100),
                                      child: IconButton(
                                          onPressed: (){}, icon: Icon(Icons.camera_alt, color: Colors.white.withOpacity(0.8), size: 40,)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(


                            child: Text(sney3iProfileController.sney3i_model?.username??"username", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
                        ),
                      )  ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Container(

                                child: Text(sney3iProfileController.sney3i_model?.serviceType??"service", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black.withOpacity(0.5)),)
                            ),
                          )  ,
                          Text(" | ", style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 20),),

                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Container(

                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: Colors.black.withOpacity(0.6),size: 20,),
                                  Text(sney3iProfileController.sney3i_model?.city??"etat", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black.withOpacity(0.5)),),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 10),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,


                            children: [
                              Row(

                                children: [
                                  Image.asset("lib/assets/like1.png",scale: 2,),
                                  SizedBox(width: 5,),
                                  Text(sney3iProfileController.sney3i_model?.like.toString()??"likes")

                                ],
                              ),
                              SizedBox(width: 15,),
                              Row(
                                children: [
                                  Image.asset("lib/assets/unlike1.png", scale: 2,),
                                  SizedBox(width: 5,),
                                  Text(sney3iProfileController.sney3i_model?.unlike.toString()??"unlikes")

                                ],
                              ),



                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 10,
                      )
                    ],
                  ),
                ),

                //
                SizedBox(height: 10,),
                Container(

                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.calendar_month),
                              SizedBox(width: 6,),
                              Text("joined"),
                              SizedBox(width: 6,),
                              Align(
                                child: Text(sney3iProfileController.sney3i_model?.createdAt??"joind"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text("Biography ", style: TextStyle(fontSize: 20),),
                                      IconButton(
                                          onPressed: (){}, icon: Icon(Icons.mode_edit_outline_outlined)
                                      )

                                    ],
                                  ),

                              SizedBox(height: 6,),
                              Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(sney3iProfileController.sney3i_model?.bio??"bio", style: TextStyle(color: Colors.black.withOpacity(0.7)),))
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child:Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(sney3iProfileController.sney3i_model?.username??"name", style: TextStyle(fontSize: 18,),),
                          IconButton(
                              onPressed: (){}, icon: Icon(Icons.mode_edit_outline_outlined)
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(sney3iProfileController.sney3i_model?.number??"name", style: TextStyle(fontSize: 18, ),),
                          IconButton(
                              onPressed: (){}, icon: Icon(Icons.mode_edit_outline_outlined)
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(sney3iProfileController.sney3i_model?.city??"name", style: TextStyle(fontSize: 18, ),),
                          IconButton(
                              onPressed: (){}, icon: Icon(Icons.mode_edit_outline_outlined)
                          )
                        ],
                      )
                    ],
                  ),
                ),



                Container(
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.8)
                    ),

                    onPressed: ()async{
                      final SharedPreferences? prefs = await _prefs ;
                      prefs?.clear();
                      Get.offAll(()=>Sney3iLogin());
                    },
                    child: Text("changer mot de passe", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Container(

                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.8)
                    ),

                    onPressed: ()async{
                      final SharedPreferences? prefs = await _prefs ;
                      prefs?.clear();
                      Get.offAll(()=>Sney3iLogin());
                    },
                    child: Text("Log Out", style: TextStyle(color: Colors.white),),
                  ),
                ),



              ],

            ),
          ),
        )

    );
  }
}
