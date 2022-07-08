import 'dart:ffi';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'add_house.dart';
import 'login_page.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser;
    signOut() async {
      await FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content : Text('Logged Out.',style: TextStyle(color: Colors.green),)));
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.home, color: Colors.white,),
            ),

            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.person, color: Colors.white,),

            ),
            Container(
              height: 25,
              width: 60,
              child: FlatButton(
                onPressed: (){},
                color: Colors.white,
                child: const Text(
                  "+",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ) ,
              ),
            ),

            IconButton(
              onPressed: (){signOut();},
              icon: const Icon(Icons.logout, color: Colors.white,),

            ),
          ],



        ),
      ),
      body: SafeArea(
        child: Container(

          child: Column(



            children: [

              IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Add()));},
                  icon: Icon(Icons.search, color: Colors.blue,size: 30,),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 70,
                      width: 100,
                      child: TextButton(
                        onPressed: (){},
                        child: const Text("Sayefi", style: TextStyle(fontSize: 20,),),
                      ),
                  ),


                  Container(
                    height: 70,
                    width: 100,
                      child: TextButton(
                        onPressed: (){}, child: const Text("9raya", style: TextStyle(fontSize: 20,),),
                      ),
                  ),
                ],

              ),


            ],



          ),
        ),
      ),



    );














    
  }
}