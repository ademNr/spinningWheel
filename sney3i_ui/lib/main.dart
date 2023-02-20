import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sney3i_ui/screens/Sney3iTopNavigation.dart';

import 'package:sney3i_ui/screens/UserBottomNavigation.dart';
import 'package:sney3i_ui/screens/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      theme: ThemeData(
          useMaterial3: true,


      ),




      home: const WelcomeScreen(),
    );
  }
}
