import 'package:code_exlity/JobDetail_3.dart';
import 'package:code_exlity/ReportProblemPage.dart';
import 'package:flutter/material.dart';

class JobDetail2 extends StatelessWidget {
  const JobDetail2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF006442),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Applications"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/Green.png',
                fit: BoxFit.cover,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text("Job Details"),
              leading: const Icon(Icons.arrow_back),
              actions: const [Icon(Icons.favorite_border)],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100), // space for bottom sheet
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildJobHeader(),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "About The Company",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildJobDescription(),

            // First TextField
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text("Website"),
            ),

            // Row with 3 Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Column(

                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return JobDetail_3();}), ); },
                      child: const Text("Update Profile & Apply", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006442),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(400, 40),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () { },
                      child: const Text("Instant Apply", style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006442),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(400, 40),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(onPressed:(){}, child:Text("Save Job" ),style:  ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF006442),side: BorderSide(color: Color(0xFF006442), width: 1),textStyle: TextStyle(
                        fontSize: 18,           // <-- change this for size
                        fontWeight: FontWeight.w500,
                      ),
                      minimumSize: Size(400, 40),),),
                  ),
                  Center(
                    child: ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return Reportproblempage();}), ); }, child:Text("Report Job" ),style:  ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF006442),side: BorderSide(color: Color(0xFF006442), width: 1),textStyle: TextStyle(
                        fontSize: 18,           // <-- change this for size
                        fontWeight: FontWeight.w500,
                      ),
                      minimumSize: Size(400, 40),),),
                  ),
                ],
              ),
            ),

            // Second TextField
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text("Remember: You should never send cash or cheques \nto a prospective employer, or provide your bank \ndetails or any other financial information."),
            ),
          ],
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
                Text(
                  "Pantry Boy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green.shade800),
                ),
                const Text("ABCD Pvt Ltd"),
                const SizedBox(height: 8),
                Row(children: const [
                  Icon(Icons.location_on, size: 16),
                  SizedBox(width: 4),
                  Text("Jayanagar, Bengaluru"),
                ]),
                const SizedBox(height: 4),
                Row(children: const [
                  Icon(Icons.access_time, size: 16),
                  SizedBox(width: 4),
                  Text("Fulltime  |  8hrs a day  |  Week Off"),
                ]),
                const SizedBox(height: 4),
                Row(children: const [
                  Icon(Icons.calendar_today, size: 16),
                  SizedBox(width: 4),
                  Text("10th March 2025"),
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
    const dummyText = '''Lorem ipsum dolor sit amet, iscing elit, sed do eiusmod 
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequatlabore et dolore magna aliqua. Ut enim ad minim veniam, 
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa.''';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(dummyText, style: const TextStyle(fontSize: 14, height: 1.5)),
    );
  }
}
