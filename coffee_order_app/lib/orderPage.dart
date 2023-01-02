import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    const List<Widget> type = <Widget>[
      Text('Small'),
      Text('Medium'),
      Text('Large')
    ];
    final List<bool> _coffeeSize = <bool>[true, false, false];
    bool vertical = false;
    return Scaffold(
      body:  Stack(
        children: [

          Stack(
              children: [
                Image.asset("lib/assets/latte.jpg"),
                Positioned(
                  top: 180,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 20),
                    child: Row(

                      children: [

                         Text("Cappucino", style: TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.w400),),
                        SizedBox(width: 100,),


                        Container(
                          width: 67,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white
                          ),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Text("4,7", style: TextStyle(fontWeight: FontWeight.w600),),
                                Text(" | "),
                                Icon(Icons.star, size: 20,color: Colors.yellow,),
                              ],
                            ),
                          ),
                        )



                      ],
                    ),
                  ),
                ),


              ],
          ),



           Container(
             margin: EdgeInsets.only(top: 240),
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    margin : EdgeInsets.only(right: 200, top: 30 ),
                      child: Text("Coffee Size", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ),
                  SizedBox(height: 20,),
                  ToggleButtons(

                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _coffeeSize.length; i++) {
                          _coffeeSize[i] = (i == index);
                        }
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: Colors.teal,
                    selectedColor: Colors.white,
                    fillColor: Colors.teal,
                    color: Colors.teal,
                    hoverColor: Colors.teal,
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 100.0,
                    ),
                    isSelected: _coffeeSize,
                    children: type,
                  ),

                  Container(
                      margin : EdgeInsets.only(right: 250, top: 40 ),
                      child: Text("About", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), 
                    
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(left: 60, right: 60, top: 20),
                    child: Text(
                        "Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder.[2][3] It is typically smaller in volume than a caffè latte, with a thicker layer of microfoam"
                         , style: TextStyle(fontWeight: FontWeight.w400, ),
                    ),
                  ),
                  SizedBox(height: 60,),

                  
                  Container(

                    width: 300,
                    height: 80.0,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40.0),
                      ),
                      color: Colors.teal,
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Add to cart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),

                          Text("|", style: TextStyle(color: Colors.white, fontSize: 20),),

                          Text("2,5 €", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold ),),

                        ],
                      ),

                    ),
                  )
                  // ToggleButtons with a multiple selection.


                ],
              ),
            ),




        ],
      ),
    );
  }
}
