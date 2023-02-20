import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sney3i_ui/controllers/Sney3iAuthController.dart';
import 'package:sney3i_ui/screens/Sney3iRegister.dart';

import 'Sney3iLogin.dart';

class Sney3iLogin extends StatefulWidget {
  const Sney3iLogin({Key? key}) : super(key: key);

  @override
  State<Sney3iLogin> createState() => _Sney3iLoginState();
}

class _Sney3iLoginState extends State<Sney3iLogin> {
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  Sney3iAuth sney3iAuth = Get.put(Sney3iAuth());

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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

                    child: Image.asset('lib/assets/sney3i.png', color: Colors.black.withOpacity(0.7),)),
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
                  backgroundColor: Colors.teal ,
                ),
                onPressed: ()async {
                  await  sney3iAuth.loginSney3i(emailController, passwordController);
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
                    Get.to(Sney3iRegister());
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
