import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/home.dart';


class Add extends StatefulWidget{

  @override
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String dropdar = 'apartment';
  String droplocation= 'Monastir';
  String pricev = '250-450dt';
  String roomSize = 'S+2';
  var rooms = ['S+1', 'S+2', 'S+3', '>S+4'];
  var diar = [
    'apartment' ,
    'studio',
    'dar',
  ];
  var wileya = [
    'Tunis', 'Ariana', 'Ben Arous', 'Mannouba', 'Bizerte', 'Nabeul', 'Béja', 'Monastir','Kairouan','Tataouine',
    'Tozeur', 'Jendouba', 'Zagouan', 'Siliana' , 'Sousse', 'Sidi bouzid', 'Sfax' , 'Gabes', 'gebili',
  ];
  var price = ['150-250dt', '250-450dt', '>450dt'];
  @override
  Widget build(BuildContext context){




    return  Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 10,),
              IconButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));},
                icon: Icon(Icons.arrow_back),
              ),

              SizedBox(height: 50,),

              const Text("Preperty type "),
              DropdownButton(
                borderRadius: BorderRadius.circular(10),
                value: dropdar,
                onChanged: (String? newValue) {
                  setState(() {
                 dropdar = newValue!;
                  });
                   },
                  items: diar
                    .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                 value: value,
                   child: Text(value),
                      );
                   }).toList(),

                ),

              //---------------
              SizedBox(height: 50,),
              Text("choose a state"),
              DropdownButton(
                borderRadius: BorderRadius.circular(10),
                  alignment: AlignmentDirectional.center,

                  value:droplocation ,
                  items: wileya.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem(
                      child: Text(value),
                      value:  value,
                    );

                  }
                  ).toList(),
                  onChanged: (String? newValue){
                    setState(() {
                      droplocation = newValue!;
                    });


                  },
              ),
              //--------------------------------
              SizedBox(height: 50,),
              Text("price Range"),
              DropdownButton(
                borderRadius: BorderRadius.circular(10),
                hint: Text("price Range"),
                  value: pricev ,
                items: price.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem(child: Text(value), value:  value,);

                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    pricev = newValue!;
                  });
                },
              ),

              //-------------
              SizedBox(height: 50,),
              Text("Rooms"),
              Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
               ),
                height: 50,
                width: 150,

                child: DropdownButton(
                  borderRadius: BorderRadius.circular(10),

                  hint: Text("Rooms"),
                  value: roomSize ,
                  items: rooms.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem(child: Text(value), value:  value,);

                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      roomSize = newValue!;
                    });
                  },
                ),
              ),
              //----------------
              SizedBox(height: 30,),
              Container(
                child: FlatButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Text("Add images"),
                        SizedBox(width: 10,),
                        Icon(Icons.camera_alt),
                      ],
                    )
                ),
              ),


              //--------------
              SizedBox(height: 20,),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),


                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),


                    onPressed: (){
                      FirebaseFirestore.instance.collection('house').doc().set(
                          {
                            'appartment_type' : dropdar ,
                            'priceRange' : pricev ,
                            'rooms' : roomSize,
                            'wileya' : droplocation,
                          }
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                    },
                    child: Text("Add"),
                  color: Colors.blueAccent,
                ),
              ),








            ],
          ),
        ),
      ),

    );
  }
}

