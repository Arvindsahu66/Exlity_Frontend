import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DeleteAccountPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class DeleteAccountPage extends StatefulWidget {
  @override
  _DeleteAccountPageState createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {

  int _selectedIndex = 3; // ← This keeps track of the selected tab

  final Color greenColor = const Color(0xFF06905C); // Deep Green Color

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // You can add navigation or actions based on selected index here
    print("Selected index: $index");
  }
  String? selectedReason;
  final TextEditingController otherController = TextEditingController();

  final List<String> reasons = [
    "Found a job already",
    "Not getting relevant jobs",
    "App is difficult to use",
    "Privacy concerns",
    "Other"
  ];

  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }

  Widget _buildRadioOption(String reason) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<String>(
          title: Text(reason),
          value: reason,
          groupValue: selectedReason,
          onChanged: (value) {
            setState(() {
              selectedReason = value;
            });
          },
        ),
        if (reason == "Other" && selectedReason == "Other")
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: otherController,
              decoration: InputDecoration(
                hintText: "Please specify",
                border: OutlineInputBorder(),
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: greenColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/Green.png', // Ensure this image exists in your assets folder
                fit: BoxFit.cover,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("Profile", style: TextStyle(color: Colors.white)),
              leading: const Icon(Icons.arrow_back, color: Colors.white),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.favorite_border, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tell us why you're leaving",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Your feedback helps us improve!",
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 20),
            ...reasons.map((reason) => _buildRadioOption(reason)).toList(),
            SizedBox(height: 30),
            Center(
              child:ElevatedButton(onPressed:(){}, child:Text("Next",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
                foregroundColor: Colors.white,
                minimumSize: Size(300, 40),),),
            )
          ],
        ),
      ),

    );
  }
}
