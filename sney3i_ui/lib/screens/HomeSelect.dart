import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sney3i_ui/controllers/Sney3iHomeController.dart';


import 'SingleSney3i.dart';

const List<String> list = <String>[
  'Ariana', 'Béja',' Ben Arous', 'Bizerte', 'Gabès', 'Gafsa',
  'Jendouba', 'Kairouan', 'Kasserine', 'Kebili', 'Kef', 'Mahdia',
  'Manouba', 'Medenine', 'Monastir', 'Nabeul', 'Sfax', 'Sidi Bouzid', 'Siliana',
  'Sousse', 'Tataouine', 'Tozeur', 'Tunis' , 'Zaghouan'
];
class HomeSelect extends StatefulWidget {
  const HomeSelect({Key? key}) : super(key: key);

  @override
  State<HomeSelect> createState() => _HomeSelectState();
}

class _HomeSelectState extends State<HomeSelect> {


  Sney3iHomeController sney3iHomeController = Get.put(Sney3iHomeController());
  var data = Get.arguments;
  String dropdownValue1 = list.first;
  @override
  void initState() {
    // TODO: implement initState
    sney3iHomeController.getSney3iaByServiceAndCity(data[0], sney3iHomeController.city.value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Container(
          width: 200,
          height: 40,

          child: DecoratedBox(
            decoration: BoxDecoration(


              borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
              gradient: LinearGradient(
                  colors: [
                    Colors.blueGrey.withOpacity(0.3),
                    Colors.blueGrey.withOpacity(0.2),
                    Colors.blueGrey.withOpacity(0.1),
                    //add more colors
                  ]),

            ),
            child: DropdownButton(
              icon: Icon(Icons.search, size: 35,),
              elevation: 1,

              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(value, style: TextStyle(letterSpacing: 0.5, fontWeight: FontWeight.bold, fontSize: 25), ))

                );
              }).toList(),
              value: dropdownValue1,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue1 = value!;
                  sney3iHomeController.service.value = dropdownValue1 ;
                  sney3iHomeController.getSney3iaByServiceAndCity(data[0], dropdownValue1);
                });
              },
              underline: SizedBox(),
              dropdownColor: Colors.white,
              iconSize: 40,
              iconEnabledColor: Colors.black.withOpacity(0.8),

            ),
          ),
        ),

        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: Colors.black,


      ),
      body: SafeArea(
          child : Column(
            children:[

              




              Expanded(
                child: Obx(

                      ()=>sney3iHomeController.isDataLoading.value?Center(child: CircularProgressIndicator(color: Colors.teal.withOpacity(0.7),),): ListView.builder(


                    scrollDirection: Axis.horizontal,
                    itemCount: sney3iHomeController.sney3i_model?.data?.length ?? 0,
                    itemBuilder: (context,index){

                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>SingleSney3i(), duration: Duration(milliseconds: 500), transition: Transition.fade, arguments:[
                            sney3iHomeController.sney3i_model
                                ?.data![index].sId,
                            sney3iHomeController.sney3i_model
                                ?.data![index].city,
                            sney3iHomeController.sney3i_model
                                ?.data![index].username,
                            sney3iHomeController.sney3i_model?.data![index].serviceType,
                            sney3iHomeController.sney3i_model?.data![index].createdAt,
                            sney3iHomeController.sney3i_model?.data![index].number,
                            sney3iHomeController.sney3i_model?.data![index].bio,
                            sney3iHomeController.sney3i_model?.data![index].photo,
                            sney3iHomeController.sney3i_model?.data![index].like,
                            sney3iHomeController.sney3i_model?.data![index].unlike,
                            sney3iHomeController.sney3i_model?.data![index].spec,
                          ] );
                        },
                        child: Container(
                          width: 400,
                          padding: EdgeInsets.all(10),

                          child: Card(

                              color: Colors.white,
                            elevation:  50 ,
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white

                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional.center,
                                          child: Container(

                                            margin: EdgeInsets.only(top: 10),
                                            height: 150,
                                            width: 150,
                                            child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: SizedBox(
                                                  width: 140,
                                                  height: 140,
                                                  child: ClipOval(
                                                    child: Image.asset("lib/assets/adem.png",scale: 0.9, ),
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.center,
                                          child: Container(

                                              child: Text("${sney3iHomeController.sney3i_model?.data![index].username}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30, color: Colors.black87),)
                                          ),
                                        )  ,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional.center,
                                              child: Container(

                                                  child: Text("${sney3iHomeController.sney3i_model?.data![index].serviceType}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black87.withOpacity(0.9)),)
                                              ),
                                            )  ,
                                            Text(" | ", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black87.withOpacity(0.9)),),

                                            Align(
                                              alignment: AlignmentDirectional.center,
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.location_on_outlined, color: Colors.black87.withOpacity(0.9),size: 20,),
                                                    Text("${sney3iHomeController.sney3i_model?.data![index].city}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black87.withOpacity(0.9)),),

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.center,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),

                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,


                                              children: [
                                                Row(

                                                  children: [
                                                    Image.asset("lib/assets/like1.png",scale: 2,color: Colors.black87,),
                                                    SizedBox(width: 5,),
                                                    Text('${sney3iHomeController.sney3i_model?.data![index].like}' , style: TextStyle(color: Colors.black87),)

                                                  ],
                                                ),
                                                SizedBox(width: 15,),
                                                Row(
                                                  children: [
                                                    Image.asset("lib/assets/unlike1.png", scale: 2,color: Colors.black87,),
                                                    SizedBox(width: 5,),
                                                    Text('${sney3iHomeController.sney3i_model?.data![index].unlike}' , style: TextStyle(color: Colors.black87),)

                                                  ],
                                                ),



                                              ],
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                  ),

                                  //
                                  SizedBox(height: 10,),
                                  Container(

                                    child: Container(
                                      padding: EdgeInsets.only(top: 20, left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.calendar_month,color: Colors.black87,),
                                                SizedBox(width: 6,),
                                                Text("joined", style: TextStyle(color: Colors.black87),),
                                                SizedBox(width: 6,),
                                                Align(
                                                  child: Text("${sney3iHomeController.sney3i_model?.data![index].createdAt.toString().substring(0,10)}", style: TextStyle(color: Colors.black87),),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Align(
                                                    alignment: AlignmentDirectional.topStart,
                                                    child: Text("Biography ", style: TextStyle(fontSize: 20, color: Colors.black87),)),
                                                SizedBox(height: 6,),
                                                Align(
                                                    alignment: AlignmentDirectional.topStart,
                                                    child: Text("${sney3iHomeController.sney3i_model?.data![index].bio}", style: TextStyle(color: Colors.black87.withOpacity(0.9)),))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(top: 50),
                                            width: 500,
                                            child: ElevatedButton(
                                                onPressed: (){},
                                                child: Text("Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1),),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black87,
                                                  animationDuration: Duration( seconds : 1)


                                                ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ],

                              ),
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
    );
  }
}
