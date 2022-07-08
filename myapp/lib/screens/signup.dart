import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Home.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();

}



class _SignUpState extends State<SignUp> {
  //email and password variables
  String _email="";
  String _password="";



  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context){

    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/frame1.png",),
              fit: BoxFit.cover),
        ),

        child: Stack(
          children : [



            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image.asset(
                "lib/assets/polygon2.png", color: Colors.blueAccent.withOpacity(0.3),

                height: 400,
                width: 300,
              ),

            ),

            Container(
              padding: EdgeInsets.fromLTRB(200, 50, 0,0),


              child: Image.asset(
                "lib/assets/house.png",
                height: 350,
                width: 350,


              ),

            ),

            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 20,),

                  // hello text---------------------------------------------
                  Container(
                    padding : const EdgeInsets.fromLTRB(0, 0, 190, 150),
                    child: const Text('Karia ',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontSize: 40,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),





                  const  SizedBox(height: 50,),





                  // email----------------------------------
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:  Colors.white70,

                      ),
                      child:  TextFormField(

                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                          hintText: ' Email',
                          prefixIcon: Icon(Icons.email),

                        ),

                        controller: emailController,
                        onChanged: (value)=> _email=value,
                        validator: (value){
                          if(value!.isEmpty){
                            return " email field is empty pease fill it ";
                          }
                        }

                      ),
                    ),
                  ),


                  // passwd------------------------------------------------

                  Padding(
                    padding: const  EdgeInsets.fromLTRB(50,5 , 50, 5),
                    child: Container(


                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:  Colors.white70,

                      ),
                      child: TextFormField(


                        obscureText: true,
                        decoration: const InputDecoration(

                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          hintText: ' Password',
                          prefixIcon: Icon(Icons.lock),
                        ),


                        controller: passwordController,
                        onChanged: (value) {
                          _password = value ;
                        },
                        validator: (value){
                          if(value!.length < 6 ){
                            return "short password";

                          }
                          if(value.isEmpty){

                            print("empty field");
                          }

                        }



                    ),
                    ),
                  ),





                  const SizedBox(height: 10,),











                  const SizedBox(height: 10,),



                  // register---------------------------------------------------
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: FlatButton(onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text

                        );
                        // ignore: use_build_context_synchronously
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  Home()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content : Text('The password provided is too weak.', style: TextStyle(color: Colors.red),)));
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content : Text('The account already exists for that email.',style: TextStyle(color: Colors.red),)));
                        }
                      } catch (e) {
                        print(e);
                        SnackBar(content: Text(e.toString()),);
                      }
                      


                    },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text('Register ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                    ),
                  ),
                  SizedBox(height: 100,),


                  TextButton(
                    onPressed: (){},
                    child: Text("Forgot Password ? ", style: TextStyle(color: Colors.blueAccent,),),
                  )










                ],
              ),
            ),

          ],
        ),
      ),



    );
  }

}

