import 'package:code_exlity/ApplicationsPage.dart';
import 'package:flutter/material.dart';

class SkillCertiUpdate extends StatefulWidget {
  const SkillCertiUpdate({super.key});

  @override
  State<SkillCertiUpdate> createState() => _SkillCertiUpdateState();
}

class _SkillCertiUpdateState extends State<SkillCertiUpdate> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add page navigation logic here if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/Green.png', fit: BoxFit.cover),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("Skills & Certifications", style: TextStyle(color: Colors.white)),
              leading: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF006442),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline_outlined), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            buildSectionTitle("Total Years of Experience*", true),
            const SizedBox(height: 20),
            buildTextField(),

            const SizedBox(height: 30),
            buildSectionTitle("Relevant Skills*", true),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                skillBox("+ Security"),
                skillBox("+ Housekeeping"),
                skillBox("+ Pantry"),
                SizedBox(width: 160, height: 40, child: buildTextField()),
              ],
            ),

            const SizedBox(height: 20),
            buildSectionTitle("Certifications", false),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                skillBox("+ First Aid"),
                skillBox("+ Fire & Safety"),
                SizedBox(width: 160, height: 40, child: buildTextField()),
              ],
            ),

            const SizedBox(height: 20),
            buildSectionTitle("Languages Known", false),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                skillBox("+ English"),
                skillBox("+ Kannada"),
                skillBox("+ Assamese"),
                skillBox("+ Hindi"),
                skillBox("+ Telugu"),
                skillBox("+ Tamil"),
                skillBox("+ Malayalam"),
                SizedBox(width: 160, height: 40, child: buildTextField()),
              ],
            ),

            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton("Save & Exit", Colors.white, const Color(0xFF006442)),
                buildButton("Save & Next", const Color(0xFF006442), Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title, bool required) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: required
            ? const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ]
            : [],
      ),
    );
  }

  Widget skillBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }


  Widget buildTextField() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        isDense: true,
      ),
    );
  }

  Widget buildButton(String label, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        // Save action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        side: const BorderSide(color: Color(0xFF006442)),
        minimumSize: const Size(140, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(label),
    );
  }
}
