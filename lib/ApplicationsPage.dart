import 'package:code_exlity/MessagePage.dart';
import 'package:flutter/material.dart';
import 'MessagePage.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF006442),
        elevation: 0,
        title: const Text("Applications"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF006442),
        unselectedItemColor: Colors.black,
        currentIndex: 1,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MessagesPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Applications"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
      body: Column(
        children: [
          const TabBarSection(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildJobCard(
                  companyLogo: "assets/bmw.png",
                  title: "Pantry Boy",
                  company: "ABCD Pvt Ltd",
                  location: "Jayanagar, Bengaluru",
                  salary: "₹ 14,000 pm",
                  type: "Fulltime",
                  hours: "8hrs a day",
                  dayOff: "Week Off",
                  date: "10ᵗʰ March 2025",
                  isNew: true,
                  isHiring: true,
                  jobClosed: false,
                ),
                const SizedBox(height: 12),
                _buildJobCard(
                  companyLogo: "assets/bmw.png",
                  title: "Security Guard",
                  company: "ABCD Pvt Ltd",
                  location: "Jayanagar, Bengaluru",
                  salary: "Not Specified",
                  type: "Fulltime",
                  hours: "8hrs a day",
                  date: "10ᵗʰ March 2025",
                  jobClosed: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  label: const Text("Filters"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006442),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sort, color: Colors.white),
                  label: const Text("Sort By \n Relevance", style: TextStyle(fontSize: 10)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006442),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard({
    required String companyLogo,
    required String title,
    required String company,
    required String location,
    required String salary,
    required String type,
    required String hours,
    String? dayOff,
    required String date,
    bool isNew = false,
    bool isHiring = false,
    bool jobClosed = false,
  }) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(companyLogo, height: 40, width: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (isNew)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text("New", style: TextStyle(color: Colors.blue, fontSize: 12)),
                              ),
                            if (isHiring)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text("Hiring Multiple Candidates", style: TextStyle(color: Colors.green, fontSize: 12)),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: jobClosed ? Colors.grey : Colors.green,
                          ),
                        ),
                        Text(company),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16),
                            const SizedBox(width: 4),
                            Text(location),
                            const Spacer(),
                            Text(salary),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.info_outline, size: 16),
                            const SizedBox(width: 4),
                            Text(type),
                            const SizedBox(width: 8),
                            Text("| $hours"),
                            if (dayOff != null) ...[
                              const SizedBox(width: 8),
                              Text("| $dayOff"),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today_outlined, size: 16),
                            const SizedBox(width: 4),
                            Text(date),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: const [
                      Icon(Icons.favorite_border, color: Colors.green),
                      SizedBox(height: 8),
                      Icon(Icons.block, color: Colors.red),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        if (jobClosed)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "JOB CLOSED",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Material(
        color: Colors.white,
        child: const TabBar(
          labelColor: Color(0xFF006442),
          unselectedLabelColor: Colors.black,
          indicatorColor: Color(0xFF006442),
          tabs: [
            Tab(text: "SAVED"),
            Tab(text: "HISTORY"),
          ],
        ),
      ),
    );
  }
}
