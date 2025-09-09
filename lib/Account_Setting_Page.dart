import 'package:flutter/material.dart';


class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle tab navigation here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
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
      body: Column(
        children: [
          _buildSettingItem(
            icon: Icons.lock_outline,
            title: "Change My Password",
            onTap: () {
              // Navigate to Change Password Page
            },
          ),
          _buildSettingItem(
            icon: Icons.phone_outlined,
            title: "Change My Phone Number",
            onTap: () {
              // Navigate to Change Phone Number Page
            },
          ),
          _buildSettingItem(
            icon: Icons.delete_outline,
            title: "Delete My Account",
            onTap: () {
              // Navigate to Delete Account Page
            },
          ),
        ],
      ),

    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black54),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }
}
