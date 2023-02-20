


import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sney3i_ui/controllers/SearchSney3i.dart';
import 'package:sney3i_ui/controllers/Sney3iHomeController.dart';

import 'package:sney3i_ui/screens/HomeSelect.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sney3i_ui/widgets/UserHeaderWidget.dart';

import '../widgets/searchField.dart';
import 'SingleSney3i.dart';
import 'Sney3iRegister.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs= SharedPreferences.getInstance();
  Sney3iHomeController homeController = Get.put(Sney3iHomeController());
  SearchSney3i searchSney3i = Get.put(SearchSney3i());
   bool  _searchBoolean= false ;
   TextEditingController searchController = TextEditingController();
   bool enableText = false ;


  @override
  Widget build(BuildContext context) {
        return Scaffold(

            appBar: AppBar(

              leading:  SizedBox(),

              actions: [ //add
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                      icon: Icon(Icons.search, size: 30,),
                      onPressed: () {

                        setState(() { //add
                          _searchBoolean = true;
                          enableText = true ;
                        });


                      }
                  ),
                ),
                !_searchBoolean ?Text("") :  Container(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                      icon: Icon(Icons.clear, size: 30,),
                      onPressed: () {
                        setState(() {
                           searchController.text = "";
                          _searchBoolean = false;
                          enableText = false ;
                        });
                      }
                  ),
                )
              ],

              scrolledUnderElevation: 0,
              foregroundColor: Colors.black.withOpacity(0.7),
              centerTitle: false,
              title: Container(

                height: 50,
                width: 600,


                child: TextFormField(
                  enabled:  enableText,
                   onChanged: (value){
                     searchSney3i.getAll(value)  ;
                   },
                  controller: searchController,
                  autofocus: true, //Display the keyboard when TextField is displayed
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  textInputAction: TextInputAction.search, //Specify the action button on the keyboard
                  decoration: const  InputDecoration(

                         border: OutlineInputBorder(gapPadding: 10, borderRadius: BorderRadius.all(Radius.circular(30)),),
                    focusedBorder:    UnderlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey)
                    ),
                    hintText: 'Recherche', //Text that is displayed when nothing is entered.
                    hintStyle: TextStyle( //Style of hintText
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),



          body: !_searchBoolean ?  SafeArea(
            child: Container(
              child: ListView(
                children: [
                  SizedBox(height: 50,),

                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child:

                      Text("Bienvenue sur Home", style: TextStyle(color : Colors.black, fontWeight: FontWeight.w800, letterSpacing: 1.5, fontSize: 20),),



                    ),
                  ),
                  //
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child:

                      Text("Devenir Sney3i !", style: TextStyle(color : Colors.black.withOpacity(0.7), fontWeight: FontWeight.w800, letterSpacing: 1, fontSize: 15),),



                    ),
                  ),
                  SizedBox(height: 10,),

                  GestureDetector(
                    onTap: (){

                      Get.to(()=>Sney3iRegister(),  ) ;

                    },
                    child: Card(
                      elevation: 20,
                      borderOnForeground: true,
                      shadowColor: Colors.black,
                      surfaceTintColor: Colors.black,
                      child: Container(
                        height : 180 ,
                        width: 220,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                                image: AssetImage("lib/assets/handy.jpg"),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high
                            ),
                            color: Colors.white
                        ),
                        child: Column(

                          children: [






                                  Container(
                                    padding: EdgeInsets.only(left: 250, top: 50),
                                      child: Icon(Icons.arrow_circle_right, color: Colors.white.withOpacity(0.9) ,size: 80,)),
                                ],



                        ),


                      ),
                    ),
                  ),


                  SizedBox(height: 30,),

                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child:


                      Text("Les services disponibles", style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 1, ),),


                    ),
                  ),
                  SizedBox(height: 10,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                           homeController.service.value = "Electricien" ;
                          Get.to(()=>HomeSelect(), arguments:['Electricien'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(

                              height : 280 ,
                            width: 180,
                              decoration: BoxDecoration(


                                  borderRadius: BorderRadius.circular(9),
                                  image: DecorationImage(
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                                    image: AssetImage("lib/assets/electrician1.png", ),
                                    fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                    
                                ),
                                color: Colors.white
                              ),
                              child: Center(
                                child: Container(
                                    child: Text("Electricien", style: TextStyle(color: Colors.white.withOpacity(0.8), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 25),)),
                              )


                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          homeController.service.value = "Menuisier" ;
                          Get.to(()=>HomeSelect(), arguments:['Menuisier'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(
                            height : 280 ,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                  image: AssetImage("lib/assets/carpenter.png", ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,



                                ),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Menuisier", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 30),)

                              ],
                            ),


                          ),
                        ),
                      ),

                    ],
                  ),
                  //
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          homeController.service.value = "Jardinier" ;
                          Get.to(()=>HomeSelect(), arguments:['Jardinier'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(
                            height : 280 ,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                  image: AssetImage("lib/assets/jardinier.png", ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,



                                ),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Jardinier", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 30),)

                              ],
                            ),


                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          homeController.service.value = "Maçon" ;
                          Get.to(()=>HomeSelect(), arguments:['Maçon'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(
                            height : 280 ,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                  image: AssetImage("lib/assets/macon.png", ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,



                                ),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Maçon", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 30),)

                              ],
                            ),


                          ),
                        ),
                      ),

                    ],
                  ),
                  //
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          homeController.service.value = "Métallier" ;
                          Get.to(()=>HomeSelect(), arguments:['Métallier'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(
                            height : 280 ,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                  image: AssetImage("lib/assets/metallier.png", ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,



                                ),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Métallier", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 30),)

                              ],
                            ),


                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          homeController.service.value = "Plombier" ;
                          Get.to(()=>HomeSelect(), arguments:['Plombier'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(
                            height : 280 ,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                  image: AssetImage("lib/assets/plomber.png", ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,



                                ),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Plombier", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 30),)

                              ],
                            ),


                          ),
                        ),
                      ),

                    ],
                  ),
                  //
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          homeController.service.value = "Peintre" ;
                          Get.to(()=>HomeSelect(), arguments:['Peintre'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(
                            height : 280 ,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                  image: AssetImage("lib/assets/painter.png", ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,



                                ),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Peintre", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 30),)

                              ],
                            ),


                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          homeController.service.value = "Mécanicien" ;
                          Get.to(()=>HomeSelect(), arguments:['Mécanicien'],  ) ;

                        },
                        child: Card(
                          elevation: 1,
                          borderOnForeground: true,
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.black,
                          child: Container(
                            height : 280 ,
                            width: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                  image: AssetImage("lib/assets/mechanin.png", ),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,



                                ),
                                color: Colors.white
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("Mécanicien", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 0.9, fontWeight: FontWeight.bold, fontSize: 30),)

                              ],
                            ),


                          ),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      homeController.service.value = "Autre" ;
                      Get.to(()=>HomeSelect(), arguments:['Autre'],  ) ;

                    },
                    child: Card(
                      elevation: 1,
                      borderOnForeground: true,
                      shadowColor: Colors.black,
                      surfaceTintColor: Colors.black,
                      child: Container(
                        height : 180 ,
                        width: 220,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                                image: AssetImage("lib/assets/others.png", ),
                                fit: BoxFit.cover,
                              filterQuality: FilterQuality.high
                            ),
                            color: Colors.white
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("Autres", style: TextStyle(color: Colors.white.withOpacity(0.9), letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 50),)
                          ],
                        ),


                      ),
                    ),
                  ),
                  SizedBox(height: 20,),



                ],
              ),
            ),
          ) : Obx(
              ()=>  searchSney3i.isDataLoading.value ? Center(child:CircularProgressIndicator(),) :  ListView.builder(
                itemCount: searchSney3i.sney3i_model?.data?.length ?? 0 ,
                itemBuilder: (context, index) {
                  return Card(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=>SingleSney3i(), duration: Duration(seconds: 1), transition: Transition.leftToRight, arguments:[
                            searchSney3i.sney3i_model
                                ?.data![index].sId,
                            searchSney3i.sney3i_model
                                ?.data![index].city,
                            searchSney3i.sney3i_model
                                ?.data![index].username,
                            searchSney3i.sney3i_model?.data![index].serviceType,
                            searchSney3i.sney3i_model?.data![index].createdAt,
                            searchSney3i.sney3i_model?.data![index].number,
                            searchSney3i.sney3i_model?.data![index].bio,
                            searchSney3i.sney3i_model?.data![index].photo,
                            searchSney3i.sney3i_model?.data![index].like,
                            searchSney3i.sney3i_model?.data![index].unlike,
                            searchSney3i.sney3i_model?.data![index].spec,
                          ] );
                        },

                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: ListTile(
                              tileColor: Colors.white,
                                title: Text(searchSney3i.sney3i_model?.data![index].username ?? "name", style: TextStyle(color: Colors.black.withOpacity(0.9),fontSize: 20, fontWeight: FontWeight.bold),),
                                    leading: Image.asset("lib/assets/adem.png"),
                              subtitle: Text(searchSney3i.sney3i_model?.data![index].serviceType??"service", style: TextStyle(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w400, fontSize: 18),),
                              isThreeLine: true,
                              trailing: Text(searchSney3i.sney3i_model?.data![index].like.toString()?? "likes")  ,

                            ),
                          ),

                      )
                  );
                }
            ),
          )
        );
  }
}
