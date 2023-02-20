import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/Sney3iAuthController.dart';
import 'Sney3iLogin.dart';
const List<String> list = <String>[
  'Ariana', 'Béja',' Ben Arous', 'Bizerte', 'Gabès', 'Gafsa',
  'Jendouba', 'Kairouan', 'Kasserine', 'Kebili', 'Kef', 'Mahdia',
  'Manouba', 'Medenine', 'Monastir', 'Nabeul', 'Sfax', 'Sidi Bouzid', 'Siliana',
  'Sousse', 'Tataouine', 'Tozeur', 'Tunis' , 'Zaghouan'
];
const List<String> list1 = <String>[
  'Electricien',
  'Jardinier',
  'Mécanicien',
  'Peintre',
  'Maçon',
  'Plombier',
  'Menuisier',
  'Métallier',
  'Autre'
];

class Sney3iRegister extends StatefulWidget {
  const Sney3iRegister({Key? key}) : super(key: key);

  @override
  State<Sney3iRegister> createState() => _Sney3iRegisterState();
}

class _Sney3iRegisterState extends State<Sney3iRegister> {
  String dropdownValue1 = list1.first;
  String dropdownValue = list.first;
  TextEditingController emailController =   TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController =  TextEditingController() ;
  TextEditingController specController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  Sney3iAuth  sney3iAuth = Get.put(Sney3iAuth());
  late File filee;


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
              width: 350,
              height: 60,
              child: DropdownButton(
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(

                   padding: EdgeInsets.only(left: 20),
                        child: Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)
                    ),
                  );
                }).toList(),
                value: dropdownValue,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;

                  });
                },
                underline: Container(
                  height: 2,
                  color: Colors.black.withOpacity(0.7),
                ),
                elevation: 17,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 350,
              height: 60,
              child: DropdownButton(
                items: list1.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
                    ),
                  );
                }).toList(),
                value: dropdownValue1,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue1 = value!;

                  });
                },
                underline: Container(
                  height: 2,
                  color: Colors.black.withOpacity(0.7),
                ),
                elevation: 17,
              ),
            ),
            SizedBox(height: 20,),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: specController,

                decoration: InputDecoration(


                    border: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelText: 'specialite',
                    hintText: 'Enter specialite'),


              ),
            ),
            SizedBox(height: 20,),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: numController,

                decoration: InputDecoration(


                    border: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelText: 'numero',
                    hintText: 'Enter numero'),


              ),
            ),
            SizedBox(height: 20,),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: bioController,

                decoration: InputDecoration(


                    border: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelText: 'Bio',
                    hintText: 'votre Bio '),


              ),
            ),
            SizedBox(height: 20,),
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
                 await sney3iAuth.registerSney3i(emailController, passwordController, usernameController
                     , dropdownValue, numController,dropdownValue1, bioController, specController);


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
                    Get.to(()=>Sney3iLogin());
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
