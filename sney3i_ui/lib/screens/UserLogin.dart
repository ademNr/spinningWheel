



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sney3i_ui/controllers/UserLoginController.dart';
import 'package:sney3i_ui/screens/HomePage.dart';
import 'package:sney3i_ui/screens/UserRegister.dart';

import '../controllers/UserRegisterController.dart';
class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  UserRegisterController  userRegisterController = Get.put(UserRegisterController());
  UserLoginController userLoginController = Get.put(UserLoginController());
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 30),
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
                    hintText: ' abc@gmail.com'),


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
                 await  userLoginController.loginUser(emailController, passwordController);
                },
                child: Text(
                  'Login',
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
                Text("New User?"),
                TextButton(
                  onPressed: (){
                    Get.to(UserRegister());
                  },
                  child: Text("Register",style: TextStyle(color: Colors.teal.withOpacity(0.9)), ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
