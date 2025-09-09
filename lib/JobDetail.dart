import 'package:code_exlity/JobDetail_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(JobDetailsApp());
}

class JobDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JobDetailsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class JobDetailsPage extends StatelessWidget {
  final Color greenColor = const Color(0xFF008037);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF006442),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Applications"),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/Green.png', // Make sure this path and image exist
                fit: BoxFit.cover,
              ),
            ),
            // AppBar content
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("Job Details"),
              leading: Icon(Icons.arrow_back),
              actions: [
                Icon(Icons.favorite_border),
              ],
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildJobHeader(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Job Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _buildJobDescription(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomSheet: ElevatedButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return JobDetail2();}), ); },
        child: const Text("Update Profile & Apply", style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF006442),
          foregroundColor: Colors.white,
          minimumSize: const Size(300, 50),
        ),
      ),
    );
  }

  Widget _buildJobHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/bmw.png", height: 30, width: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pantry Boy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green.shade800)),
                const Text("ABCD Pvt Ltd"),
                const SizedBox(height: 8),
                Row(children: [
                  Icon(Icons.location_on, size: 16),
                  const SizedBox(width: 4),
                  const Text("Jayanagar, Bengaluru")
                ]),
                const SizedBox(height: 4),
                Row(children: [
                  Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  const Text("Fulltime  |  8hrs a day  |  Week Off")
                ]),
                const SizedBox(height: 4),
                Row(children: [
                  Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 4),
                  const Text("10th March 2025")
                ]),
              ],
            ),
          ),
          const Icon(Icons.block, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildJobDescription() {
    const dummyText = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(dummyText, style: TextStyle(fontSize: 14, height: 1.5)),
    );
  }
}
