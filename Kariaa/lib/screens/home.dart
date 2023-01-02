


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/profile.dart';
import 'package:myapp/screens/search_house.dart';

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
      appBar: AppBar(
        centerTitle: true,
       elevation: 100,
       scrolledUnderElevation: 50,
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white54,
        automaticallyImplyLeading: true,
        actions: [

          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: IconButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Search()));},
                icon: Icon(Icons.search,color: Colors.blue,size: 29,)
            ),
          ),
        ],


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



      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('house').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) return Center(child: Text('Loading', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blueAccent),));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              return ListView(

                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return   Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    margin: EdgeInsets.all(10),


                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(document['wileya'], style: TextStyle(fontSize: 20),),

                        Row(children: [
                          Text("  Price Range :  "),
                          Text(document['priceRange']),
                        ]
                        ),
                        Row(children: [
                          Text("  appartment type :  "),
                          Text(document['appartment_type']),
                        ]
                        ),

                        Row(children: [
                          Text("  rooms :  "),
                          Text(document['rooms']),
                        ]
                        ),



                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[


                            FlatButton(


                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              color: Colors.blue,
                              child: const Text('Check out'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),

                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
    );


















    
  }
}