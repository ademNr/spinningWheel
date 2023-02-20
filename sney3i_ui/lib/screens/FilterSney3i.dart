import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sney3i_ui/controllers/Sney3iFilterController.dart';
import 'package:sney3i_ui/widgets/UserHeaderWidget.dart';

import '../controllers/Sney3iHomeController.dart';
import '../controllers/Sney3iFilterController.dart';
import 'SingleSney3i.dart';

const List<String> list1 = <String>[

  'Electricien',
  'Jardinier',
  'Mécanicien',
  'Peintre',
  'Maçon',
  'Plombier',
  'Menuisier',
  'Métallier',
  'Autre'
];
const List<String> list2 = <String>[
  'Ariana', 'Béja',' Ben Arous', 'Bizerte', 'Gabès', 'Gafsa',
  'Jendouba', 'Kairouan', 'Kasserine', 'Kebili', 'Kef', 'Mahdia',
  'Manouba', 'Medenine', 'Monastir', 'Nabeul', 'Sfax', 'Sidi Bouzid', 'Siliana',
  'Sousse', 'Tataouine', 'Tozeur', 'Tunis' , 'Zaghouan'
];
class FilterSney3i extends StatefulWidget {
  const FilterSney3i({Key? key}) : super(key: key);

  @override
  State<FilterSney3i> createState() => _FilterSney3iState();
}

class _FilterSney3iState extends State<FilterSney3i> {
  Sney3iFilterController sney3iFilterController = Get.put(Sney3iFilterController());
  String dropdownValue1 = list1.first;
  String dropdownValue2 = list2.first ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:  SafeArea(
        child: Container(
                    margin: EdgeInsets.all(2),
          child: Column(
              children:[
                Container(
                  padding: EdgeInsets.only( right: 50, bottom: 10, left: 50, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        child: DecoratedBox(


                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blueGrey.withOpacity(0.3),
                                  Colors.blueGrey.withOpacity(0.2),
                                  Colors.blueGrey.withOpacity(0.1),




                                  //add more colors
                                ]),

                          ),
                          child: DropdownButton(
                            items: list1.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(value)),
                              );
                            }).toList(),
                            value: dropdownValue1,
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue1 = value!;
                                sney3iFilterController.servicetype.value = dropdownValue1 ;
                                sney3iFilterController.getSney3iaByServiceAndCity();
                              });
                            },
                            underline: SizedBox(),
                            elevation: 17,
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),

                      Container(

                        child: DecoratedBox(
                          decoration: BoxDecoration(


                            borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                            gradient: LinearGradient(
                                colors: [

                                  Colors.blueGrey.withOpacity(0.3),
                                  Colors.blueGrey.withOpacity(0.2),
                                  Colors.blueGrey.withOpacity(0.1),
                                ]),

                          ),
                          child: DropdownButton(
                            items: list2.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(value)),
                              );
                            }).toList(),
                            value: dropdownValue2,
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue2 = value!;
                                sney3iFilterController.city.value = dropdownValue2 ;
                                sney3iFilterController.getSney3iaByServiceAndCity();
                              });
                            },
                            underline: SizedBox(),
                            elevation: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),



                Expanded(
                  child: Obx(
                          ()=>sney3iFilterController.isDataLoading.value?Center(child: CircularProgressIndicator(color: Colors.teal.withOpacity(0.7),),): GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 90 / 120,),

                        scrollDirection: Axis.vertical,
                        itemCount: sney3iFilterController.sney3i_model?.data?.length ?? 0,
                        itemBuilder: (context,index){

                          return GestureDetector(
                            onTap: (){
                              Get.to(()=>SingleSney3i(), duration: Duration(seconds: 1), transition: Transition.leftToRight, arguments:[
                                sney3iFilterController.sney3i_model
                                    ?.data![index].sId,
                                sney3iFilterController.sney3i_model
                                    ?.data![index].city,
                                sney3iFilterController.sney3i_model
                                    ?.data![index].username,
                                sney3iFilterController.sney3i_model?.data![index].serviceType,
                                sney3iFilterController.sney3i_model?.data![index].createdAt,
                                sney3iFilterController.sney3i_model?.data![index].number,
                                sney3iFilterController.sney3i_model?.data![index].bio,
                                sney3iFilterController.sney3i_model?.data![index].photo,
                                sney3iFilterController.sney3i_model?.data![index].like,
                                sney3iFilterController.sney3i_model?.data![index].unlike,
                                sney3iFilterController.sney3i_model?.data![index].spec,
                              ] );
                            },
                            child: Container(
                              color: Colors.white,


                              height: 600,
                              width: 200,
                              child : Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),

                                ),

                                elevation: 1,
                                color: Colors.white,
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [



                                    Container(
                                      margin: EdgeInsets.all(5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0), //add border radius

                                      ),
                                    ),
                                    ListTile(
                                      leading:
                                      Image.asset("lib/assets/adem.png",),
                                      title:  Text(sney3iFilterController.sney3i_model?.data![index].username?? "name", overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black.withOpacity(0.8)),),
                                      subtitle: Align(

                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on_outlined, color: Colors.teal,size: 15,),
                                            Text(
                                              sney3iFilterController.sney3i_model?.data![index].city??'city',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(color: Colors.teal.withOpacity(0.6)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),




                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.handyman, color: Colors.black.withOpacity(0.9),),
                                          SizedBox(width: 5,),
                                          Text(
                                            sney3iFilterController.sney3i_model?.data![index].serviceType ?? "service",
                                            style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 20, fontWeight: FontWeight.bold ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),

                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.more_horiz, color: Colors.teal),
                                            SizedBox(width: 5,),
                                            Expanded(child: Text(sney3iFilterController.sney3i_model?.data![index].spec??'specialite',overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black.withOpacity(0.7)),)),
                                          ],
                                        )

                                    ),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Icon(Icons.access_time, color: Colors.black.withOpacity(0.6),),
                                          SizedBox(width: 5,),

                                          Text(
                                            sney3iFilterController.sney3i_model?.data![index].createdAt.toString().substring(0,10)??'creation date',
                                            style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 10, fontWeight: FontWeight.w400),
                                          ),


                                        ],
                                      ),
                                    ),


                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Image.asset("lib/assets/like1.png", scale: 2,color: Colors.teal,),
                                          Text(sney3iFilterController.sney3i_model?.data![index].like.toString()??"likes"),
                                          SizedBox(width: 5,),
                                          Image.asset("lib/assets/unlike1.png", scale: 2,color: Colors.black.withOpacity(0.7),),
                                          Text(sney3iFilterController.sney3i_model?.data![index].unlike.toString()??"unlikes"),
                                          SizedBox(width: 20,),
                                          Container(
                                            margin: EdgeInsets.only(right: 15,bottom: 10 ),
                                            child: Align(
                                              alignment: AlignmentDirectional.bottomEnd,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(

                                                  backgroundColor: Colors.blueGrey.withOpacity(0.1),

                                                  elevation: 0,
                                                ),

                                                onPressed: (){
                                                  Get.to(
                                                          ()=>SingleSney3i(),transition: Transition.leftToRight, duration: Duration(seconds: 1),
                                                      arguments: [


                                                        sney3iFilterController.sney3i_model
                                                            ?.data![index].sId,
                                                        sney3iFilterController.sney3i_model
                                                            ?.data![index].city,
                                                        sney3iFilterController.sney3i_model
                                                            ?.data![index].username,
                                                        sney3iFilterController.sney3i_model?.data![index].serviceType,
                                                        sney3iFilterController.sney3i_model?.data![index].createdAt,
                                                        sney3iFilterController.sney3i_model?.data![index].number,
                                                        sney3iFilterController.sney3i_model?.data![index].bio,
                                                        sney3iFilterController.sney3i_model?.data![index].photo,
                                                        sney3iFilterController.sney3i_model?.data![index].like,
                                                        sney3iFilterController.sney3i_model?.data![index].unlike,
                                                        sney3iFilterController.sney3i_model?.data![index].spec,


                                                      ]
                                                  );
                                                },
                                                child: Text("Profile", style: TextStyle(color: Colors.black),),

                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
