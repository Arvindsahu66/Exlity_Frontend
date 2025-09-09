import 'package:code_exlity/LoginScreen.dart';
import 'package:flutter/material.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({Key ? key}) : super(key :key);

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 50),
            Text("Welcome to Exlity",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Image.asset("assets/Hello.png",width: 400,height: 250,),
            Text("Choose your language/ ",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Text("nನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆರಿಸಿ /",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Text("अपनी भाषा चुने /ं",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

            SizedBox(height: 20),

            ElevatedButton(onPressed:(){}, child:Text("Kannada",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFFDBDBDB),
              foregroundColor: Color(0xFF006442),
              minimumSize: Size(300, 40),),),
            ElevatedButton(onPressed:(){}, child:Text("Hindi",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFFDBDBDB),
              foregroundColor: Color(0xFF006442),
              minimumSize: Size(300, 40),),),
            ElevatedButton(onPressed:(){}, child:Text("Tamil",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFFDBDBDB),
              foregroundColor: Color(0xFF006442),
              minimumSize: Size(300, 40),),),
            ElevatedButton(onPressed:(){}, child:Text("Telugu",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFFDBDBDB),
              foregroundColor: Color(0xFF006442),
              minimumSize: Size(300, 40),),),
            ElevatedButton(onPressed:(){}, child:Text("Assamese",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFFDBDBDB),
              foregroundColor: Color(0xFF006442),
              minimumSize: Size(300, 40),),),
            ElevatedButton(onPressed:(){}, child:Text("Odia",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFFDBDBDB),
              foregroundColor: Color(0xFF006442),
              minimumSize: Size(300, 40),),),
            ElevatedButton(onPressed:(){}, child:Text("English",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFFDBDBDB),
              foregroundColor: Color(0xFF006442),
              minimumSize: Size(300, 40),),),
            ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return MyLogin();}), );}, child:Text("Continue",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
              foregroundColor: Colors.white,
              minimumSize: Size(300, 40),),),

            Spacer(),


            Text("©2025 Exlity"),
            SizedBox(height: 50)
          ],

        ),
      ),
    );

  }
}
