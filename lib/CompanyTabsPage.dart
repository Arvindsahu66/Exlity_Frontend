import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: CompanyTabsPage()));
}

class CompanyTabsPage extends StatelessWidget {
  const CompanyTabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 80),
          child: Column(
            children: [
              Stack(
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
                    leading: const Icon(Icons.arrow_back, color: Colors.white),
                    title: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/company_logo.png'),
                          radius: 15,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Company Pvt Ltd",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    actions: const [
                      Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.more_vert, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: "CHAT",),
                  Tab(text: "ALERTS"),
                  Tab(text: "SCHEDULES"),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ChatPage(),
            AlertsPage(),
            SchedulesPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF006442),
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
            BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
            BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: "Messages"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
          ],
        ),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("Chat Page"),
      ),
    );
  }
}

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: const Align(
        alignment: Alignment.topLeft,
        child: Text.rich(
          TextSpan(
            text: "You have 3 jobs matching your profile, ",
            children: [
              TextSpan(
                text: "Click here",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: " to view them",
              ),
            ],
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text("Schedules Page"),
      ),
    );
  }
}