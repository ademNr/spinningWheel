import 'package:flutter/material.dart';
import 'package:myapp/screens/signup.dart';
import 'login_page.dart';
import 'signup.dart';


class Welcome extends StatefulWidget{
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,

     body: Container(
     constraints: const BoxConstraints.expand(),
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("lib/assets/frame1.png",),
    fit: BoxFit.cover),
    ),
       child: Stack(
         children: [




           // karia logo from the tooop-----
           Container(
             padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
             child: const Text("Karia", style: TextStyle(
               fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w900,
              color: Colors.blueAccent,
               fontSize: 50,
             ),
             ),
           ),





           //working on the polygon and the house containers :

           Container(
             margin: EdgeInsets.fromLTRB(0, 40, 190, 0),
             child: Image.asset("lib/assets/polygon2.png" , color: Colors.blueAccent.withOpacity(0.2),fit: BoxFit.cover, height: 250,width: 300,),

           ),
           Container(
             margin: EdgeInsets.fromLTRB(200, 180, 0, 0),
             child : Image.asset("lib/assets/polygon.png", color: Colors.blueAccent.withOpacity(0.2),height: 300,width: 300,fit: BoxFit.cover,),
           ),

           Container(
             padding: EdgeInsets.fromLTRB(0, 140, 130, 0),


             child:  Image.asset("lib/assets/house.png",fit: BoxFit.cover, height:301,width: 301,),
           ),
           //----------------------------------------------------------------

               // text part that define what is the application and what it does :
           Container(
             padding: EdgeInsets.fromLTRB(43, 450, 0, 0),

             child: const Text(
               "Karia is an application that helps people find houses for rent whether "
                   "for studying if you're a student or for summer holidays. ",
               style: TextStyle(
                 fontSize: 11,
                 fontWeight: FontWeight.bold,
                 fontStyle: FontStyle.normal,
                 color: Colors.blueAccent,


               ),
             ),

           ),
           //------------------------------------------------------------------


           Container(
             padding: const EdgeInsets.fromLTRB(50, 500, 0, 0,),


             child: FlatButton(
               onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage())); },
               height: 40,

               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(50)),
               color: Colors.blueAccent,
               child: const Text(
                   "Get Started  ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 11,
                  ),
               ),
             ),
           ),

           Container(
             padding: const EdgeInsets.fromLTRB(126, 517, 0, 0,),

             child: const  Icon(
               Icons.arrow_forward,
               color: Colors.white,
               size: 14,

             ),
           ),
         ],

       ) ,



     ),
    );




  }
}