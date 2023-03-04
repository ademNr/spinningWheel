import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voice_gpt/HomePage.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SpeechScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            color: Colors.white,
            child:Image.asset("lib/assets/splash1.png",  scale: 3,)
        ),
            SizedBox(height: 50,),
            Text("AdemNr Assistant", style: TextStyle(color: Colors.teal.withOpacity(0.6), fontWeight: FontWeight.w900, fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
