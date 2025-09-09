import 'package:flutter/material.dart';

class Jobprefupdate extends StatefulWidget {
  const Jobprefupdate({super.key});

  @override
  State<Jobprefupdate> createState() => _JobprefupdateState();
}

class _JobprefupdateState extends State<Jobprefupdate> {
  int _selectedIndex = 3;
  String? _joiningAvailability;
  String? _accommodationRequired;
  bool fullTime = false;
  bool partTime = false;
  bool oneTime = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/Green.png', fit: BoxFit.cover),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("Job Preferences", style: TextStyle(color: Colors.white)),
              leading: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ],
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
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "My Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline_outlined), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text("Preferred Job Shift", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: fullTime,
                        onChanged: (value) {
                          setState(() {
                            fullTime = value!;
                          });
                        },
                      ),
                      const Text("Day Shift", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                      const SizedBox(width: 30),
                      Checkbox(
                        value: partTime,
                        onChanged: (value) {
                          setState(() {
                            partTime = value!;
                          });
                        },
                      ),
                      const Text("Rotational Shifts", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: oneTime,
                        onChanged: (value) {
                          setState(() {
                            oneTime = value!;
                          });
                        },
                      ),
                      const Text("Night Shift", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Available for Joining*", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5),
              child: Wrap(
                spacing: 30,
                children: [
                  buildRadioOption('Immediately'),
                  buildRadioOption('Within A Week'),
                  buildRadioOption('Within A Month'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Accommodation Required", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Yes',
                  groupValue: _accommodationRequired,
                  onChanged: (value) {
                    setState(() {
                      _accommodationRequired = value;
                    });
                  },
                ),
                const Text('Yes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                const SizedBox(width: 40),
                Radio<String>(
                  value: 'No',
                  groupValue: _accommodationRequired,
                  onChanged: (value) {
                    setState(() {
                      _accommodationRequired = value;
                    });
                  },
                ),
                const Text('No', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(height: 20),
            buildSectionTitle("Expected Salary", true),
            const SizedBox(height: 20),
            buildTextField(),
            const SizedBox(height: 30),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton("Save & Exit", Colors.white, const Color(0xFF006442)),
                buildButton("Save & Next", const Color(0xFF006442), Colors.white),
              ],
            )
          ],

        ),

      ),
    );
  }

  Widget buildRadioOption(String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: _joiningAvailability,
          onChanged: (val) {
            setState(() {
              _joiningAvailability = val;
            });
          },
        ),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
Widget buildSectionTitle(String title, bool isRequired) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.black,
        ),
        children: isRequired
            ? [
          const TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ]
            : [],
      ),
    ),
  );
}

Widget buildTextField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Expected Salary',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      keyboardType: TextInputType.number,
    ),
  );
}
Widget buildButton(String label, Color bgColor, Color textColor) {
  return ElevatedButton(
    onPressed: () {
      // Save action here
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: textColor,
      side: const BorderSide(color: Color(0xFF006442)),
      minimumSize: const Size(140, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
    child: Text(label),
  );
}
