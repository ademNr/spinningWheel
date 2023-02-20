import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:sney3i_ui/screens/FilterSney3i.dart';
import 'package:sney3i_ui/screens/HomePage.dart';

import 'Profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  int maxCount = 3;

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const FilterSney3i(),
    const UserProfile(),

  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)

          ? AnimatedNotchBottomBar(

           blurOpacity: 1,
           pageController: _pageController,
          color: Colors.white,
          showLabel: true,
           notchColor: Colors.white,

          bottomBarItems: [
           BottomBarItem(

            inActiveItem: Image.asset("lib/assets/home2.png", color: Colors.black.withOpacity(0.8),),
            activeItem: Image.asset("lib/assets/home2.png", ),
            itemLabel: 'Home',

          ),
           BottomBarItem(
            inActiveItem: Image.asset("lib/assets/search1.png", color: Colors.black.withOpacity(0.8),) ,
            activeItem: Image.asset("lib/assets/search1.png") ,
            itemLabel: 'Filtre',
          ),

          ///svg example
          BottomBarItem(
            inActiveItem: Image.asset("lib/assets/profile1.png", color: Colors.black.withOpacity(0.8),),
            activeItem: Image.asset("lib/assets/profile1.png", ),
            itemLabel: 'Profile',
          ),


        ],
        onTap: (index) {
          /// control your animation using page controller
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        },
      )
          : null,
    );
  }
}
