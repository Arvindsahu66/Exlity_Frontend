import 'package:code_exlity/JobListingPage.dart';
import 'package:code_exlity/Registrationpage.dart';
import 'package:flutter/cupertino.dart' show AssetImage;
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key ? key}) : super(key :key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 200),
            Image.asset("assets/Group 1382.png",width: 350,height: 150,),
            Text("Build your profile, explore and apply to",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          Text("your favourite jobs and get contacted by",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            Text("employers immediately",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 30),//for the space

            ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return Joblistingpage();}), );}, child:Text("Sign In" ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
              foregroundColor: Colors.white,
              minimumSize: Size(300, 60),),),
            SizedBox(height: 10),
            ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return RegistrationPage();}), );}, child:Text("Create a New Account" ),style:  ElevatedButton.styleFrom(backgroundColor: Colors.white,
              foregroundColor: Color(0xFF006442),side: BorderSide(color: Color(0xFF006442), width: 1),textStyle: TextStyle(
                fontSize: 18,           // <-- change this for size
                fontWeight: FontWeight.w500,
              ),
              minimumSize: Size(300, 60),),),
            Spacer(),
            Text("Currently we are available in Bengaluru",style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,  // default weight
              color: Colors.black, ),),
            SizedBox(height: 15),
            Text("By using Exlity, you agree and consent to our:"),
            Text("Terms of Servic, Cookie Policy, Privacy Policy.",style: TextStyle( decoration: TextDecoration.underline, ),),
            SizedBox(height: 10),
            Text("©2025 Exlity"),
            SizedBox(height: 50)
          ],

        ),
      ),
    );
  }
}
