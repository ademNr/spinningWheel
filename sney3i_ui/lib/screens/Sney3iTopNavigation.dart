import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sney3i_ui/controllers/Sney3iProfileController.dart';
import 'package:sney3i_ui/screens/FilterSney3i.dart';
import 'package:sney3i_ui/screens/HomePage.dart';
import 'package:sney3i_ui/screens/Sney3iProfile.dart';
import 'package:sney3i_ui/screens/Sney3iUpdate.dart';

import 'Profile.dart';

class Sney3iBottomNavigation extends StatefulWidget {
  const Sney3iBottomNavigation({Key? key}) : super(key: key);

  @override
  State<Sney3iBottomNavigation> createState() => _Sney3iBottomNavigationState();
}

class _Sney3iBottomNavigationState extends State<Sney3iBottomNavigation> with TickerProviderStateMixin {
  Sney3iProfileController sney3iProfileController = Get.put(Sney3iProfileController());
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this,  initialIndex: 0,);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 20),

                  child: Row(

                    children: [
                      IconButton(
                        onPressed: (){
                          Get.to(()=>Sney3iProfile());
                        },
                        icon: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)
                            ),

                            child: Icon(Icons.message , color: Colors.black.withOpacity(0.8),)),),

                    ],
                  ),
                )
              ],
              elevation: 10,
              scrolledUnderElevation: 0,
              foregroundColor: Colors.white,
              title: Transform(
                transform:  Matrix4.translationValues(-60.0, 0.0, 0.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: Image.asset("lib/assets/adem.png", scale: 0.5,),

                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Obx(()=> sney3iProfileController.isDataLoading.value? Text("") :
                    Text("${sney3iProfileController.sney3i_model?.username}",style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold, fontSize: 18),)),
                  ],
                ),
              ),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                indicatorColor: Colors.black,

                tabs: <Tab>[
                  Tab(

                    child: Image.asset("lib/assets/home2.png", scale: 2,color: Colors.black,),
                  ),
                  Tab(child: Image.asset("lib/assets/search1.png", scale: 2, color: Colors.black,),),
                  Tab(child: Image.asset("lib/assets/profile1.png", scale: 2,color: Colors.black,),),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(

          controller: _tabController,
          children: <Widget>[
            HomeScreen(),
            FilterSney3i(),
            Sney3iProfile()
          ],
        ),
      ),
    );
  }
}
