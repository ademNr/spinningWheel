
import 'package:flutter/material.dart';
class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

        children :[
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
            ),
          ),
          //


          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              height: 100, width: 250,
              child: Image.asset("lib/assets/sney3i.png",color: Colors.black.withOpacity(0.6),),
            ),
          ),


        ]
    );
  }
}
