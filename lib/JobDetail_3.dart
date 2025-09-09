import 'package:code_exlity/ApplicationsPage.dart';
import 'package:flutter/material.dart';

class JobDetail_3 extends StatelessWidget {
  const JobDetail_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF006442),
        unselectedItemColor: Colors.black,
        currentIndex: 0, // Set default active tab index
        onTap: (index) {
          if (index == 1) {
            // Navigate to ApplicationsPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ApplicationsPage()),
            );
          }
          // Add other conditions if you want to handle other tabs
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Applications"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: const Color(0xFF006442),
          elevation: 0,
          title: const Text("Job Details"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),

      // Page Body (unchanged)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("You are applying for the role of:"),
            const SizedBox(height: 12),
            Row(
              children: [
                Image.asset("assets/bmw.png", height: 40, width: 40),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pantry Boy",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.bold)),
                    const Text("ABCD Pvt Ltd"),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.location_on, size: 16),
                        SizedBox(width: 4),
                        Text("Jayanagar, Bengaluru"),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Text("₹ 14,000 pm",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(height: 32),
            const Text("Your details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            _buildRowField("Full Name", "Kishan Sharma"),
            _buildRowDropdown("Gender", ["Male", "Female", "Other"], "Male"),
            _buildRowField("Experience", "Kishan Sharma"),
            _buildRowField("Relevant Skills", "Kishan Sharma"),
            _buildRowField("Certifications", "Kishan Sharma"),
            _buildRowField("Languages Known", "Kishan Sharma"),
            _buildRowField("Education", "Kishan Sharma"),
            _buildRowDropdown("Last Drawn Salary", ["Rs. 14,000 Monthly"], "Rs. 14,000 Monthly"),

            const SizedBox(height: 16),
            const Text(
              'By clicking on “Continue Application” I agree to Exlity sending my application to ABCD Pvt Ltd '
                  'for the purpose of the application process related to this job.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return ApplicationsPage();}), );},
                child: const Text("Continue Application", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006442),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 50),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Remember: You should never send cash or cheques to a prospective employer, or provide your bank details or any other financial information.\n'
                  'We pay great attention to vetting all jobs that appear on our site, but please get in touch if you see any roles asking for such payments or financial details from you.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 140, child: Text(label, style: const TextStyle(fontSize: 14))),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: value,
                border: const OutlineInputBorder(),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowDropdown(String label, List<String> items, String selectedItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 140, child: Text(label, style: const TextStyle(fontSize: 14))),
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedItem,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  onChanged: (_) {},
                  dropdownColor: Colors.white,
                  items: items.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
