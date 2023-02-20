

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:sney3i_ui/controllers/Sney3iAuthController.dart';
import 'package:sney3i_ui/controllers/Sney3iFilterController.dart';
import 'package:sney3i_ui/controllers/Sney3iHomeController.dart';
import 'package:sney3i_ui/controllers/Sney3iProfileController.dart';
import 'package:sney3i_ui/controllers/Sney3iUpdateController.dart';
import 'package:sney3i_ui/widgets/UserHeaderWidget.dart';


class SingleSney3i extends StatefulWidget {
  const SingleSney3i({Key? key}) : super(key: key);

  @override
  State<SingleSney3i> createState() => _SingleSney3iState();
}

class _SingleSney3iState extends State<SingleSney3i> {
   Sney3iFilterController sney3iFilterController = Get.put(Sney3iFilterController());
   Sney3iHomeController sney3iHomeController = Get.put(Sney3iHomeController());
   UpdateSney3i updateSney3i = Get.put(UpdateSney3i());
   var data = Get.arguments;
   bool isLiked = false ;
   bool isUnliked = false ;
  int  likeCount = 0 ;
  int unlikeCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

        appBar: AppBar(
          scrolledUnderElevation: 0,

        ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body : SafeArea(
        child: ListView(
          children: [
            Container(
              color: Colors.white,

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

                        child: Text("${data[2]}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),)
                    ),
                  )  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(

                            child: Text("${data[3]}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black.withOpacity(0.5)),)
                        ),
                      )  ,
                      Text(" | ", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.grey.withOpacity(0.9)),),

                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined, color: Colors.black.withOpacity(0.6),size: 20,),
                              Text("${data[1]}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.black.withOpacity(0.5)),),

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
                              Image.asset("lib/assets/like1.png",scale: 2,),
                              SizedBox(width: 5,),
                              Text('${data[8].toString()}')

                            ],
                          ),
                          SizedBox(width: 15,),
                          Row(
                            children: [
                              Image.asset("lib/assets/unlike1.png", scale: 2,),
                              SizedBox(width: 5,),
                              Text('${data[9].toString()}')

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
            SizedBox(height: 20,),
            Container(
              color: Colors.white,
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
                         Icon(Icons.calendar_month),
                         SizedBox(width: 6,),
                         Text("joined"),
                         SizedBox(width: 6,),
                         Align(
                           child: Text("${data[4].toString().substring(0,10)}"),
                         ),
                       ],
                     ),
                   ),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text("Biography ", style: TextStyle(fontSize: 20),)),
                          SizedBox(height: 6,),
                          Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text("${data[6]}", style: TextStyle(color: Colors.black.withOpacity(0.7)),))
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(20),
                      child: ElevatedButton(


                          onPressed: (){},
                         style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.black.withOpacity(0.8),
                          elevation: 0,),
                        child: Container(
                          padding: EdgeInsets.only(left: 99),
                          child: Row(
                            children: [
                              Icon(Icons.call, size: 30,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text("Call Now ", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //
            SizedBox(height: 20,),
            Container(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.all(60),
                child: Column(
                  children: [
                    Text("like or unlike ${data[2]} ? ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(0.7)),),

                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LikeButton(
                          size: 60,
                          isLiked : isLiked,
                          likeCount : likeCount,


                          likeBuilder: (isLiked ){
                            final color = isLiked ?  Colors.teal : Colors.grey ;
                            return Image.asset("lib/assets/like1.png" , color: color,);
                          },
                          countBuilder: (count , isLiked, text){

                            return Text(
                              "",
                            );
                          },
                          onTap: (isLiked)async{
                             this.isLiked= !isLiked;
                             if(!isLiked){
                               setState(() {
                                 likeCount +=1 ;
                               });
                               await  updateSney3i.updateSney3iLike((data[8] + likeCount).toString(), data[0]);
                             }else{
                               setState(() {
                                 likeCount-=1;
                               });
                               await  updateSney3i.updateSney3iLike((data[8]+ likeCount).toString(), data[0]);
                             }

                             return !isLiked ;
                            },


                        ),
                        //unlike
                        SizedBox(width: 20,),
                        LikeButton(
                          size: 60,
                          isLiked : isUnliked,
                          likeCount : unlikeCount,


                          likeBuilder: (isLiked ){
                            final color = isUnliked ?  Colors.teal : Colors.grey ;
                            return Image.asset("lib/assets/unlike1.png" , color: color,);
                          },
                          countBuilder: (count , isLiked, text){

                            return Text(
                              "",
                            );
                          },
                          onTap: (isLiked)async{
                            this.isUnliked= !isLiked;
                            if(!isLiked){
                              setState(() {
                                unlikeCount +=1 ;
                              });
                              await  updateSney3i.updateSney3iUnlike((data[9] + unlikeCount).toString(), data[0]);
                            }else{
                              setState(() {
                                unlikeCount-=1;
                              });
                              await  updateSney3i.updateSney3iUnlike((data[9]+ unlikeCount).toString(), data[0]);
                            }

                            return !isLiked ;
                          },


                        ),

                      ],

                    ),
                  ],
                ),
              ),
            )


            //





          ],

        ),
      )

    );
  }
}
