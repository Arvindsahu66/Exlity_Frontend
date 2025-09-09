import 'package:code_exlity/AdditionalFieldsPage.dart';
import 'package:code_exlity/IdentificationCompliancePage.dart';
import 'package:code_exlity/LocationAvailabilityPage.dart';
import 'package:code_exlity/SkillcertiUpdate.dart';
import 'package:code_exlity/WorkExperUpdPage.dart';
import 'package:code_exlity/personalDetailPage.dart';
import 'package:flutter/material.dart';
import 'ContactDetailPage.dart';
import 'PersonalInfo.dart';
import 'ContactDetailPage.dart';
import 'LocationAvailabilityPage.dart';
import 'WorkExperUpdPage.dart';
import 'SkillsCertificationsPage.dart';
import 'JobPrefUpdate.dart';
// Make sure this file exists

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  int _selectedIndex = 3; // ← This keeps track of the selected tab

  final Color greenColor = const Color(0xFF06905C); // Deep Green Color

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // You can add navigation or actions based on selected index here
    print("Selected index: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: greenColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex, // ← Bind to current index
        onTap: _onItemTapped, // ← Handle tab selection
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: "My Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: "Message",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),

      // The rest of your body and widgets
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/Green.png', // Make sure this exists in assets folder
                fit: BoxFit.cover,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(Icons.arrow_back, color: Colors.white),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(greenColor),
          const SizedBox(height: 16),
          _buildProfileProgressCard(greenColor),
          const SizedBox(height: 30),
          _buildEditableItem("Personal Details", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Personaldetailpage(),
              ),
            );
          }),
          _buildEditableItem("Contact Details", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Contactdetailpage(),
              ),
            );
          }),
          _buildEditableItem("Location & Availability", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Locationavailabilitypage(),
              ),
            );
          }),
          _buildEditableItem("Work Experience", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Workexperupdpage()),
            );
          }),
          _buildEditableItem("Skills & Certifications", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SkillCertiUpdate()),
            );
          }),
          _buildEditableItem("Job Preferences", () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Jobprefupdate()),
            );
          }),
          _buildEditableItem("Identification & Compliances", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IdentificationCompliancePage(),
              ),
            );
          }),
          _buildEditableItem("Additional Fields", () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Additionalfieldspage(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(Color greenColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: greenColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Krishna Sharma",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 4),
                Text(
                  "Add Current Job Title",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "+91-98765 43210",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Bengaluru, KA",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text("Email", style: TextStyle(fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileProgressCard(Color greenColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F7D31),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.45, // profile completion percent
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "Your Profile is 45% Complete!",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Add more information to your Profile to increase its strength and impress employers.",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              foregroundColor: greenColor,
              backgroundColor: Colors.white,
            ),
            child: const Text("Take Help to Fill the Profile"),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableItem(String title, [VoidCallback? onTap]) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.6),
          top: BorderSide(color: Colors.grey, width: 0.6),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: const Icon(Icons.edit, color: Colors.black),
        onTap: onTap,
      ),
    );
  }
}
