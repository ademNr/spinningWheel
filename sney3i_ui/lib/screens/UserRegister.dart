
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sney3i_ui/screens/HomePage.dart';
import '../controllers/UserRegisterController.dart';
import 'UserLogin.dart';
class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController emailController = new  TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController() ;
  UserRegisterController  userRegisterController = Get.put(UserRegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child:  Container(
                    width: 400,
                    height: 300,

                    child: Image.asset('lib/assets/login.png', color: Colors.black.withOpacity(0.7),)),
              ),
            ),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,

                decoration: InputDecoration(


                    border: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),


              ),
            ),
            SizedBox(height: 15,),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,

                decoration: InputDecoration(


                    border: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelText: 'username',
                    hintText: 'username'),


              ),
            ),
            Padding(

              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,


                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),

              ),
            ),

            SizedBox(height: 30,),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: ()async {
                  await userRegisterController.registerUser(emailController, passwordController, usernameController);


                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have account?"),
                TextButton(
                  onPressed: (){
                    Get.to(UserLogin());
                  },
                  child: Text("Login",style: TextStyle(color: Colors.teal.withOpacity(0.9)), ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
