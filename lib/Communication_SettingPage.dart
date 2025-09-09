import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CommunicationSettingsPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class CommunicationSettingsPage extends StatefulWidget {
  @override
  _CommunicationSettingsPageState createState() =>
      _CommunicationSettingsPageState();
}

class _CommunicationSettingsPageState extends State<CommunicationSettingsPage> {
  bool receiveJobAlerts = true;
  String jobAlertMethod = 'Whatsapp';
  bool receiveInterviewNotifications = false;
  bool receiveUpdatesAndOffers = false;
  bool allNotificationsOff = false;

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Receive Job Alerts"),
            Row(
              children: [
                _buildRadio("Yes", receiveJobAlerts, () {
                  setState(() => receiveJobAlerts = true);
                }),
                _buildRadio("No", !receiveJobAlerts, () {
                  setState(() => receiveJobAlerts = false);
                }),
              ],
            ),
            if (receiveJobAlerts)
              Row(
                children: [
                  _buildMethodRadio("Whatsapp"),
                  _buildMethodRadio("SMS"),
                  _buildMethodRadio("Email"),
                ],
              ),
            const SizedBox(height: 16),
            _buildSectionTitle("Receive Interview Notifications"),
            Row(
              children: [
                _buildRadio("Yes", receiveInterviewNotifications, () {
                  setState(() => receiveInterviewNotifications = true);
                }),
                _buildRadio("No", !receiveInterviewNotifications, () {
                  setState(() => receiveInterviewNotifications = false);
                }),
              ],
            ),
            const SizedBox(height: 16),
            _buildSectionTitle("Receive Updates and Offers"),
            Row(
              children: [
                _buildRadio("Yes", receiveUpdatesAndOffers, () {
                  setState(() => receiveUpdatesAndOffers = true);
                }),
                _buildRadio("No", !receiveUpdatesAndOffers, () {
                  setState(() => receiveUpdatesAndOffers = false);
                }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Turn off All App Notifications",
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: allNotificationsOff,
                  onChanged: (value) {
                    setState(() => allNotificationsOff = value);
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed:(){}, child:Text("Update",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
                foregroundColor: Colors.white,
                minimumSize: Size(300, 40),),),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRadio(String title, bool selected, VoidCallback onTap) {
    return Row(
      children: [
        Radio(
          value: true,
          groupValue: selected,
          onChanged: (_) => onTap(),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(title, style: const TextStyle(fontSize: 16)),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildMethodRadio(String method) {
    return Row(
      children: [
        Radio<String>(
          value: method,
          groupValue: jobAlertMethod,
          onChanged: (value) {
            setState(() {
              jobAlertMethod = value!;
            });
          },
        ),
        GestureDetector(
          onTap: () => setState(() => jobAlertMethod = method),
          child: Text(method),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }
}
