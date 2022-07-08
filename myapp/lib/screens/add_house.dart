import 'package:flutter/material.dart';
import 'package:myapp/screens/home.dart';


class Add extends StatefulWidget{

  @override
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String dropdar = 'appartment';
  String droplocation= 'monastir';
  var diar = [
    'appartment' ,
    'studio',
    'dar',
  ];
  var wileya = [
    'Tunis', 'Ariana', 'Ben Arous', 'Mannouba', 'Bizerte', 'Nabeul', 'Béja',
    'Jendouba', 'Zaghouan', 'Siliana', 'Le Kef', 'Sousse', 'Monastir', 'Mahdia',
    'Kasserine', 'Sidi Bouzid', 'Kairouan', 'Sfax',
    'Gafsa', 'Gabès', 'Médenine',' Tozeur', 'Kebili' , 'Ttataouine'

  ];
  @override
  Widget build(BuildContext context){

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));},
              icon: Icon(Icons.arrow_back),
            ),

            const Text("Preperty type "),

            //--------------------------------





          ],
        ),
      ),

    );
  }
}

