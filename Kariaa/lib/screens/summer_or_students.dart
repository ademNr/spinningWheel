import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/profile.dart';
import 'package:myapp/screens/search_house.dart';

import 'Home.dart';
import 'add_house.dart';
import 'login_page.dart';

class Choice extends StatelessWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    signOut() async {
      await FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content : Text('Logged Out.',style: TextStyle(color: Colors.green),)));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Karia", style: TextStyle (color: Colors.white,fontWeight: FontWeight.bold),),

      ),

      drawer: Drawer(

        child : ListView(
          children : [
            DrawerHeader(
              child: Text("Karia", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),),
              curve: Curves.bounceOut,
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(

                height: 50,
                highlightColor: Colors.blue,

                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));},
                child: Row(

                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10,),
                    Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
              ),
            ),
            //-----------------------
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(

                height: 50,
                highlightColor: Colors.blue,

                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));},
                child: Row(

                  children: [
                    Icon(Icons.house),
                    SizedBox(width: 10,),
                    Text("Home", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
              ),
            ),

            //-----------------------
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(

                height: 50,
                highlightColor: Colors.blue,

                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));},
                child: Row(

                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text("Search for a house", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
              ),
            ),
            //---------------------------------
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(

                height: 50,
                highlightColor: Colors.blue,

                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Add()));},
                child: Row(

                  children: [
                    Icon(Icons.add_home_work_outlined),
                    SizedBox(width: 10,),
                    Text("Add house", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
              ),
            ),
            //----------------------------------------------
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(

                height: 50,
                highlightColor: Colors.blue,

                onPressed: (){signOut();},
                child: Row(

                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10,),
                    Text("Log Out", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
              ),
            ),




          ],
        ),
      ),

      body: Center(
        child: Column(
          children: [
            FlatButton(
                onPressed: (){},
                child: Text("Karia For students ? "),
            ),
            FlatButton(
                onPressed: (){},
                child: Text("Karia for summer ? "),
            ),
          ],
        ),

      ),
    );
  }
}
