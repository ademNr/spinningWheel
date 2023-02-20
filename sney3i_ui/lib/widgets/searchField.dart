import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const  TextField(

      autofocus: true, //Display the keyboard when TextField is displayed
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search, //Specify the action button on the keyboard
      decoration: InputDecoration( //Style of TextField
        enabledBorder: UnderlineInputBorder( //Default TextField border
            borderSide: BorderSide(color: Colors.black)
        ),
        focusedBorder: UnderlineInputBorder( //Borders when a TextField is in focus
            borderSide: BorderSide(color: Colors.grey)
        ),
        hintText: 'Search', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle( //Style of hintText
          color: Colors.grey,
          fontSize: 20,
        ),
      ),
    );
  }
}
