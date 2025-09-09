import 'package:flutter/material.dart';

class Resumepage extends StatefulWidget {
  const Resumepage({super.key});

  @override
  State<Resumepage> createState() => _ResumepageState();
}

class _ResumepageState extends State<Resumepage> {
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
              title: const Text("Your Resume", style: TextStyle(color: Colors.white)),
              leading: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(greenColor),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            _buildDetailsCard(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Back"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: greenColor,
                    side: BorderSide(color: greenColor),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement download logic here
                  },
                  icon: const Icon(Icons.download),
                  label: const Text("Download"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(Color greenColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: greenColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Krishna Sharma", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 4),
                Text("Add Current Job Title", style: TextStyle(color: Colors.teal, fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text("+91-98765 43210", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                Text("Bengaluru, KA", style: TextStyle(fontWeight: FontWeight.w400)),
                Text("Email", style: TextStyle(fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 16),
              ),
            ],
          )
        ],
      ),
    );
  }



  Widget _buildDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Date of Birth               : 07-11-1995"),
          SizedBox(height: 10),
          Text("Gender                       : Male"),
          SizedBox(height: 10),
          Text("Education                   : Diploma"),
          SizedBox(height: 10),
          Text("WhatsApp Number    : +91 98765 43210"),
          SizedBox(height: 10),
          Text("Current Address        : Current Address, Lorem Ipsum\n                                      Current Add, "
              "Current Address, \n                                       Ipsum Current Address"),
          SizedBox(height: 10),
          Text("Years of Experience : 3 years"),
          SizedBox(height: 10),
          Text("Previous Employers & Job Roles:"),
          SizedBox(height: 10),
          Text("Feb 2022 - Oct 2023   ABC Pvt Ltd"),
          SizedBox(height: 10),
          Text("                                     Housekeeping"),
          SizedBox(height: 10), Text("Oct 2023 - Jan 2024   ABC Pvt Ltd"),
          Text("                                     Housekeeping"),
          SizedBox(height: 10),
          Text("Jan 2024 - Present    ABC Pvt Ltd"),
          SizedBox(height: 10),
          Text("                                     Housekeeping"),
          SizedBox(height: 10),
          Text("Relevant Skills          : Security"),
          SizedBox(height: 10),
          Text("Certifications            : Certification 1"),
          SizedBox(height: 10),
          Text("Languages Known    : Kannada, Hindi, Telugu, Tamil"),
        ],
      ),
    );
  }
}
