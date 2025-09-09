import 'package:flutter/material.dart';

class Personaldetailpage extends StatefulWidget {
  const Personaldetailpage({super.key});

  @override
  State<Personaldetailpage> createState() => _PersonaldetailpageState();
}

class _PersonaldetailpageState extends State<Personaldetailpage> {
  String? selectedGender;
  String? selectedEducation;

  final List<String> educationOptions = [
    'High School',
    'Diploma',
    'Graduate',
    'Post Graduate',
    'PhD',
  ];

  final Color greenColor = const Color(0xFF0F7D31);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
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
              title: const Text("Personal Detail", style: TextStyle(color: Colors.white)),
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
            SizedBox(height: 20),
            _buildLabel("Full Name", isRequired: true),
            SizedBox(height: 10),
            const TextField(decoration: InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 20),

            _buildLabel("Date of Birth", isRequired: true),
            SizedBox(height: 10),

            const TextField(decoration: InputDecoration(border: OutlineInputBorder())),
            const SizedBox(height: 20),

            _buildLabel("Gender", isRequired: true),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                const Text("Male",style: TextStyle(fontWeight: FontWeight.w500),),
                const SizedBox(width: 50),
                Radio<String>(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                const Text("Female",style: TextStyle(fontWeight: FontWeight.w500),),
              ],
            ),
            const SizedBox(height: 20),

            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildLabel("Education"),
            DropdownButtonFormField<String>(
              hint: const Text("Pick your Qualifications"),
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: selectedEducation,
              onChanged: (value) => setState(() => selectedEducation = value),
              items: educationOptions.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),


            SizedBox(height: 150),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Save & Exit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF006442),
                      side: BorderSide(color: Color(0xFF006442), width: 1),
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Save & Next",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006442),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(300, 45),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: isRequired
              ? [const TextSpan(text: ' *', style: TextStyle(color: Colors.red))]
              : [],
        ),
      ),
    );
  }
}
