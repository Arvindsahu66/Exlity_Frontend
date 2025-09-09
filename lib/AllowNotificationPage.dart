import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Allownotificationpage extends StatefulWidget {
  const Allownotificationpage({super.key});

  @override
  State<Allownotificationpage> createState() => _AllownotificationpageState();
}

class _AllownotificationpageState extends State<Allownotificationpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/wp.jpg'),
    fit: BoxFit.cover,
    ),
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
    child: Column(

    children: [
    SizedBox(height: 70),
    Image.asset("assets/Group 1382.png", width: 350, height: 100),
    SizedBox(height: 100),
      Text("Allow notification so you don't \n          miss any update",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xFF006442),) ),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {},
        child: const Text("Allow Notiifcations", style: TextStyle(fontSize: 18),),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF006442),
          foregroundColor: Colors.white,
          minimumSize: const Size(300, 60),
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(onPressed:(){}, child:Text("Manage Preferences" ),style:  ElevatedButton.styleFrom(backgroundColor: Colors.white,
        foregroundColor: Color(0xFF006442),side: BorderSide(color: Color(0xFF006442), width: 1),textStyle: TextStyle(
          fontSize: 18,           // <-- change this for size
          fontWeight: FontWeight.w500,
        ),
        minimumSize: Size(300, 60),),),
      SizedBox(height: 20),
      ElevatedButton(onPressed:(){}, child:Text("Maybe Next Time" ),style:  ElevatedButton.styleFrom(backgroundColor: Colors.white,
        foregroundColor: Color(0xFF006442),side: BorderSide(color: Color(0xFF006442), width: 1),textStyle: TextStyle(
          fontSize: 18,           // <-- change this for size
          fontWeight: FontWeight.w500,
        ),
        minimumSize: Size(300, 60),),),


    ],
    ),

    ),
    ),
    );
  }
}
