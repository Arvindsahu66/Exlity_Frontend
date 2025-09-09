import 'package:flutter/material.dart';
import 'JobListingPage.dart';
import 'ApplicationsPage.dart';
import 'MessagePage.dart';
import 'CompanyTabsPage.dart';
import 'MorePage.dart';

class Reportproblempage extends StatefulWidget {
  const Reportproblempage({super.key});

  @override
  State<Reportproblempage> createState() => _ReportproblempageState();
}

class _ReportproblempageState extends State<Reportproblempage> {
  String? selectedReason;
  final TextEditingController descriptionController = TextEditingController();

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

  final List<String> reasons = [
    "It's offensive or harassing",
    "Asking for money or seems like a fake job",
    "Incorrect Company, location or job details",
    "I think its NOT a Job, but selling something",
    "Other",
  ];

  final Color greenColor = const Color(0xFF006442);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: greenColor,
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
                'assets/Green.png',
                fit: BoxFit.cover,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("Job Detail", style: TextStyle(color: Colors.white)),
              leading: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Choose a Problem:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(Icons.close),
                ],
              ),
              const SizedBox(height: 10),

              const Text(
                'Pantry Boy, ABCD Pvt Ltd',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),

              // Radio buttons
              ...reasons.map((reason) {
                return RadioListTile<String>(
                  title: Text(reason),
                  value: reason,
                  groupValue: selectedReason,
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                );
              }).toList(),

              const SizedBox(height: 8),
              const Text(
                'Describe your problem below:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),

              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter details...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[200],
                child: const Text(
                  'Protect your privacy \nAvoid disclosing personal information like your name, phone number, or any details that may personally identify you.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),

              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Report to Exlity",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    foregroundColor: Colors.white,
                    alignment: Alignment.center,
                    minimumSize: const Size(300, 40),
                  ),
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                "All Job Ads are subject to Exlity's Terms of services. We allow users to flag postings that may be in violation of those terms.\n\n"
                    "Job Ads may also be flagged by Exlity. However, no moderation system is perfect, and flagging a posting does not ensure that it will be removed.",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
