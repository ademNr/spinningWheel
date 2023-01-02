

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'Home.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}



class _LoginPageState extends State<LoginPage> {
  //email and password variables
  String _email="";
  String _password="";



  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

                      controller: emailController,
                      onChanged: (value)=> _email=value,
                      validator: (value){
                        if(value!.isEmpty){
                          return " please fill the email field. " ;
                        }
                      },


                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),

                        hintText: ' Email',
                        prefixIcon: Icon(Icons.email),

                      ),


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
                      controller: passwordController,
                      onChanged: (value)=> _password=value,

                      obscureText: true,
                      decoration: const InputDecoration(

                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                        hintText: ' Password',
                        prefixIcon: Icon(Icons.lock),
                      ),

                    ),

                  ),
                ),


                const SizedBox(height: 10,),




                // login in----------------------------------------------


                  SizedBox(
                    height: 50,
                    width: 300,


                    child: FlatButton(onPressed: () async {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()

                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  Home()));


                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content : Text("No user found for that email.", style: TextStyle(color : Colors.red),)));
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content : Text('Wrong password provided for that user.',style: TextStyle(color: Colors.red),)));
                        }
                      }



                      },

                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text('Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      ),


                    ),
                  ),



                const SizedBox(height: 10,),



                // register---------------------------------------------------
                SizedBox(
                  height: 50,
                  width: 300,
                  child: FlatButton(onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text('Register ?',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                  ),
                ),
                SizedBox(height: 50,),


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

