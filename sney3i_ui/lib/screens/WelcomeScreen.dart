import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sney3i_ui/screens/Sney3iLogin.dart';

import 'Sney3iRegister.dart';
import 'UserLogin.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: (){Get.to(UserLogin(), duration: Duration(seconds: 1), transition: Transition.fade );},
                child: Card( 
                  color: Colors.white,
                  elevation: 1,
                  child: Column(
                    children: [

                      Image.asset("lib/assets/Normaluser.png",color: Colors.black.withOpacity(0.7),),
                      TextButton(

                        onPressed: (){
                          Get.to(UserLogin(), duration: Duration(seconds: 1), transition: Transition.fade );

                        },
                        child: Text("User ", style: TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.w900),),
                      ),
                    ],
                  ),
                ),
              ),
                 SizedBox(height: 30,),
                 GestureDetector(
                   onTap: (){Get.to(()=>Sney3iLogin(), duration: Duration(seconds: 1), transition: Transition.fade );},
                   child: Card(
                     color: Colors.white,
                     elevation: 1,
                     child: Column(
                       children: [

                         Image.asset("lib/assets/sney3i.png",color: Colors.black.withOpacity(0.7),),
                         TextButton(


                           onPressed: (){
                             Get.to(()=>Sney3iLogin(), duration: Duration(seconds: 1), transition: Transition.fade );

                           },
                           child: Text("Sney3i!", style: TextStyle(color: Colors.teal, fontSize: 20, fontWeight: FontWeight.w900),),
                         ),
                       ],
                     ),
                   ),
                 )


            ],
          ),
        ),
      ),
    );
  }
}

