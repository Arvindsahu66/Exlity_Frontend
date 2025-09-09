import 'package:code_exlity/SkillsCertificationsPage.dart';
import 'package:flutter/material.dart';

class Workexp extends StatefulWidget {
  const Workexp({super.key});

  @override
  State<Workexp> createState() => _WorkexpState();
}

class _WorkexpState extends State<Workexp> {
  String? _selectedGender;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Image.asset("assets/Group 1382.png", width: 280, height: 150),
              Text("Fill your Work Experience",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900, color: Color(0xFF006442)),
              ),
              SizedBox(height: 23),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 45),
                  child: Text("Total Years of Experience*", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 40,),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: TextField(
                      maxLength: 20,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        hintText: 'Fresher',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  /*
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("1st Preferred \n Location ",
                      style: TextStyle( fontSize: 18),
                    ),
                  ),

                  const SizedBox(width: 22),*/ // space between label and text field

                  SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        hintText: 'Experienced',
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 35,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        // hintText: '',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),


              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text("Previous Employers & Job Roles", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("Employer \nName ",
                      style: TextStyle( fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 22), // space between label and text field
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        // hintText: '',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("Role",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 67), // space between label and text field
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        // hintText: 'Enter your name',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("Time \nPeriod",
                      style: TextStyle(fontSize: 18,fontWeight:FontWeight.w400),
                    ),
                  ),
                  const SizedBox(width: 50), // space between label and text field
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        //  hintText: 'Enter your name',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),

              SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 42),
                  child: Text("Last Drawn Salary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 40,),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        //hintText: 'DD-MM-YYYY',
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 40,),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        hintText: 'Yearly',
                      ),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  /*
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("1st Preferred \n Location ",
                      style: TextStyle( fontSize: 18),
                    ),
                  ),

                  const SizedBox(width: 22),*/ // space between label and text field

                  SizedBox(width: 20),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: TextField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                        hintText: 'Monthly',
                      ),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),

                ],
              ),



              Spacer(),

              ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return SkillsCertificationsPage();}), );}, child:Text("Continue",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
                foregroundColor: Colors.white,
                minimumSize: Size(300, 60),),),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}