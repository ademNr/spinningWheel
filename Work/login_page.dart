import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override

}

class _LoginPageState extends State<LoginPage> {



  @override

  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blueAccent,
              Colors.lightBlue,
              Colors.lightBlueAccent,
            ],
          ),
        ),

        child: SafeArea(




          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 20,),

              // hello text---------------------------------------------
              const Text('KARYA ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              const Text('Welcome again to Karya ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 50,),





              // email----------------------------------
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Colors.white70,

                  ),
                  child: const TextField(

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',

                    ),
                  ),
                ),
              ),


              // passwd------------------------------------------------

              Padding(
                padding: EdgeInsets.fromLTRB(50,5 , 50, 5),
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Colors.white70,

                  ),
                  child: const TextField(

                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),

                ),
              ),


              SizedBox(height: 10,),




              // login in----------------------------------------------

                RaisedButton(onPressed: () async {
                 dynamic result = await _auth.signInAnon();
                 if(result==null)
                   print('error signing in ');
                 else {
                   print('signed in ');
                   print(result);
                 }
                },
                  color: Colors.white70,
                  child: Text('Log in'),

                  
                ),


              SizedBox(height: 10,),






              // register---------------------------------------------------
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text('not a membre ?', style: TextStyle( color:  Colors.white),),
                  FlatButton(
                    onPressed : () {} ,
                    child: Text('Register ?'),
                  ),

                ],
              ),


              SizedBox(height: 40,),



              // logo ----------------------------
              Column(

                children: [

                  Container(

                    child: const Icon(
                      Icons.houseboat_sharp,

                ),
                  ),


                  Container(


                    child: const Text('Karya',

                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),

      ),

    );


  }
}