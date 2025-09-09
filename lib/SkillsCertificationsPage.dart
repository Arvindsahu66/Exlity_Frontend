import 'package:code_exlity/JobPref.dart';
import 'package:flutter/material.dart';

class SkillsCertificationsPage extends StatelessWidget {
  const SkillsCertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wp.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Image.asset("assets/logo.png", width: 280, height: 150),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Fill your Skills & Certifications",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006442),
                ),
              ),
            ),
            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text("Job Preference*", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  rectangularBox("+ Security"),
                  rectangularBox("+ Housekeeping"),
                  rectangularBox("+ Pantry"),
                  SizedBox(width: 120, height: 40, child: textBox()),  // Reduced width
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text("Certifications", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  rectangularBox("+ Certi 1"),
                  rectangularBox("+ Certification 2"),
                  SizedBox(width: 100, height: 40, child: textBox()),  // Reduced width
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 34),
              child: Text("Languages Known", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 34),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  rectangularBox("+ English"),
                  rectangularBox("+ Kannada"),
                  rectangularBox("+ Assamese"),
                  rectangularBox("+ Hindi"),
                  rectangularBox("+ Telugu"),
                  rectangularBox("+ Tamil"),
                  SizedBox(width: 100, height: 40, child: textBox()),  // Reduced width
                ],
              ),
            ),

            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return Jobpref();}), );},
                child: const Text("Continue", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006442),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 60),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Rectangular Box Widget with black border and reduced width
  static Widget rectangularBox(String label) {
    return Container(
      height: 40,
      width: 150,  // Reduced width for the boxes
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.zero,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14, color: Color(0xFF006442)),
      ),
    );
  }

  // Input TextField Widget with black border and reduced width
  static Widget textBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.zero,
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }
}
