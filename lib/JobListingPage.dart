import 'package:code_exlity/AlertPage.dart';
import 'package:code_exlity/CompanyTabsPage.dart';
import 'package:code_exlity/MessagePage.dart';
import 'package:flutter/material.dart';
import 'JobDetail.dart';
import 'ApplicationsPage.dart';
import 'MessagePage.dart';
import 'AlertPage.dart';
import 'MorePage.dart';

class Joblistingpage extends StatefulWidget {
  const Joblistingpage({super.key});

  @override
  State<Joblistingpage> createState() => _JoblistingpageState();
}

class _JoblistingpageState extends State<Joblistingpage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Joblistingpage(),
    const ApplicationsPage(),
    const MessagesPage(),
    const CompanyTabsPage(),
    const Morepage(),
  ];

  void _onItemTapped(int index) {
    if (index != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF006442),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Applications"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                'assets/Green.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search by Jobs, Skills and keywords",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: const [
                            Icon(Icons.language, color: Color(0xFF006442)),
                            Text("English",
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 325,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Jayanagar, Bengaluru",
                          prefixIcon: Icon(Icons.location_on_outlined),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Jobs for you, based on your activity",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JobDetailsApp()),
                        );
                      },
                      child: jobCard(
                        title: "Pantry Boy",
                        company: "ABCD Pvt Ltd",
                        location: "Jayanagar, Bengaluru",
                        salary: "₹ 14,000 pm",
                        date: "10th March 2025",
                        tags: ["New", "Hiring Multiple Candidates"],
                        extra: "Week Off",
                      ),
                    ),
                    jobCard(
                      title: "Security Guard",
                      company: "ABCD Pvt Ltd",
                      location: "Jayanagar, Bengaluru",
                      salary: "Unspecified",
                      date: "10th March 2025",
                      tags: [],
                    ),
                    jobCard(
                      title: "Security Guard",
                      company: "ABCD Pvt Ltd",
                      location: "Jayanagar, Bengaluru",
                      salary: "Unspecified",
                      date: "10th March 2025",
                      tags: ["New", "Urgently Hiring"],
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text: "There are other listings that are partially matching,\n ",
                          style: TextStyle(color: Colors.blue),
                          children: [
                            TextSpan(
                              text: "Click here to view those.",
                              style: TextStyle(decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.filter_list, color: Colors.white),
                          label: Text("Filters"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF006442),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.sort, color: Colors.white),
                          label: const Text("Sort By \n Relevance", style: TextStyle(fontSize: 10)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF006442),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 11),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget jobCard({
    required String title,
    required String company,
    required String location,
    required String salary,
    required String date,
    required List<String> tags,
    String extra = '',
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/bmw.png", height: 30, width: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 5,
                        runSpacing: 3,
                        children: tags.map((tag) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF006442)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: Color(0xFF006442),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )).toList(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF006442),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(company, style: const TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
                Column(
                  children: const [
                    Icon(Icons.favorite_border, color: Color(0xFF006442), size: 18),
                    SizedBox(height: 5),
                    Icon(Icons.block, color: Colors.redAccent, size: 18),
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 14),
                      const SizedBox(width: 4),
                      Text(location, style: const TextStyle(fontSize: 12)),
                      const SizedBox(width: 12),
                      const Icon(Icons.money, size: 14),
                      const SizedBox(width: 4),
                      Text(salary, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.info_outline, size: 14),
                      const SizedBox(width: 4),
                      const Text("Fulltime", style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      const Text("|", style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 8),
                      const Text("8hrs a day", style: TextStyle(fontSize: 12)),
                      if (extra.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        const Text("|", style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 8),
                        Text(extra, style: const TextStyle(fontSize: 12)),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  const Icon(Icons.access_time_outlined, size: 14),
                  const SizedBox(width: 4),
                  Text(date, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}