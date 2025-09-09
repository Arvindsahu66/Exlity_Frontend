import 'package:code_exlity/JobDetail.dart';
import 'package:code_exlity/ProfilePage.dart';
import 'package:flutter/material.dart';

class Morepage extends StatelessWidget {
  const Morepage({super.key});

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
              icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline), label: "Message"),
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
              title: Text("More",style: TextStyle(color: Colors.white),),
              centerTitle:true,
              leading: Icon(Icons.arrow_back),
              actions: [
                Icon(Icons.favorite_border),
              ],
            ),

          ],
        ),
      ),



      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("View Resume/Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green.shade900),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_circle, size: 48, color: Colors.black38),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Your Profile is 45% Complete!",
                            style: TextStyle(
                              color: Color(0xFF06905C),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Add more information to your Profile to increase its strength and impress employers.",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return Profilepage();}), );},
                    child: const Text("Complete my Profile", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006442),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(350, 40),
                    ),
                  ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Request Help to Complete Profile", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor:const Color(0xFF006442),
                    minimumSize: const Size(350, 40),
                    side: const BorderSide(color: Color(0xFF006442), width: 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height:10),
          _buildListItem("Account Settings"),
          _buildListItem("Communication Settings"),
          _buildListItem("Sign Out", subtitle: "+91 98765 43210"),
          _buildListItem("Share App"),
          _buildListItem("Rate App", subtitle: "Version(0.0.01)"),
          _buildListItem("Send Feedback"),
          _buildListItem("Raise Ticket"),
          _buildListItem("Privacy Policy"),
          _buildListItem("Terms & Conditions"),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, {String? subtitle}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: subtitle != null ? Text(subtitle) : null,
        onTap: () {
          // Add navigation or action here
        },
      ),
    );
  }

}