import 'package:flutter/material.dart';

class Afterlogin extends StatefulWidget {
  const Afterlogin({super.key});

  @override
  State<Afterlogin> createState() => _AfterloginState();
}

class _AfterloginState extends State<Afterlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SizedBox(height: 230),
          Image.asset("assets/Logo.png",width: 350,height: 150,),
          SizedBox(height: 230),
          Center(
            child: Text(
              "Welcome back, Name!\nWe have more 5 job opening since last time!",
              textAlign: TextAlign.center, // Center the text inside the widget
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color(0xFF006442),
              ),
            ),
          ),
          SizedBox(height: 20),

          ],
    ),
        ),


    );
  }
}
