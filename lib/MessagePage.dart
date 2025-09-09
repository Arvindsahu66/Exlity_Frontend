import 'package:flutter/material.dart';
import 'MorePage.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  int _selectedIndex = 2; // Default index for "My Jobs"

  void _onItemTapped(int index) {
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Morepage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Messages"),
          centerTitle: true,
          backgroundColor: const Color(0xFF006442),
          elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: TabBarSection(),
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
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Applications"),
            BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Alerts"),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
          ],
        ),
        body: const TabBarView(
          children: [
            SavedMessagesTab(),
            Center(child: Text("No archived messages.")),
          ],
        ),
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        labelColor: const Color(0xFF006442),
        unselectedLabelColor: Colors.black,
        indicatorColor: const Color(0xFF006442),
        tabs: const [
          Tab(text: "SAVED"),
          Tab(text: "HISTORY"),
        ],
      ),
    );
  }
}

class SavedMessagesTab extends StatelessWidget {
  const SavedMessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _jobCard(
          title: "Security Guard",
          company: "ABCD Pvt Ltd",
          location: "Jayanagar, Bengaluru",
          salary: "Unspecified",
          jobType: "Fulltime",
          hours: "8hrs a day",
          date: "10ᵗʰ March 2025",
        ),
        const SizedBox(height: 12),
        const _SectionHeader(title: "Interview Scheduled"),
        _jobCard(
          title: "Security Guard",
          company: "ABCD Pvt Ltd",
          location: "Jayanagar, Bengaluru",
          salary: "Unspecified",
          jobType: "Fulltime",
          hours: "8hrs a day",
          date: "10ᵗʰ March 2025",
        ),
        const SizedBox(height: 12),
        const _SectionHeader(title: "Requested Documents"),
      ],
    );
  }

  Widget _jobCard({
    required String title,
    required String company,
    required String location,
    required String salary,
    required String jobType,
    required String hours,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/bmw.png", height: 40, width: 40), // Replace with actual image
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(company, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14),
                    const SizedBox(width: 4),
                    Text(location),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.money, size: 14),
                    const SizedBox(width: 4),
                    Text(salary),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.info_outline, size: 14),
                    const SizedBox(width: 4),
                    Text("$jobType | $hours"),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 14),
                    const SizedBox(width: 4),
                    Text(date),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.circle, color: Colors.green, size: 14),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF006442),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
