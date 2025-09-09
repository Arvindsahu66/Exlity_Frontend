import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Locationavailabilitypage extends StatefulWidget {
  const Locationavailabilitypage({super.key});

  @override
  State<Locationavailabilitypage> createState() => _LocationavailabilitypageState();
}

class _LocationavailabilitypageState extends State<Locationavailabilitypage> {
  String? _selectedGender;
  bool fullTime = false;
  bool partTime = false;
  bool oneTime = false;

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        if (isRequired) const Text(" *", style: TextStyle(color: Colors.red, fontSize: 16)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
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
              child: Image.asset('assets/Green.png', fit: BoxFit.cover),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("Location & Availability", style: TextStyle(color: Colors.white)),
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
            _buildLabel("Current Address", isRequired: true),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s,./-]')),
                LengthLimitingTextInputFormatter(200),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your Current Address",
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              ),
            ),

            const SizedBox(height: 20),
            const Text("  Preferred Work Location*",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, ),
              textAlign: TextAlign.center,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 1),
                  child: Text("1st Preferred \n Location ",
                    style: TextStyle( fontSize: 18),
                  ),
                ),
                const SizedBox(width: 22), // space between label and text field
                SizedBox(
                  width: 220,
                  height: 50,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                      // hintText: '',
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 1),
                  child: Text("2nd Preffered \n Location ",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20), // space between label and text field
                SizedBox(
                  width: 220,
                  height: 50,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                      // hintText: 'Enter your name',
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 1),
                  child: Text("2nd Preffered \n Location ",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20), // space between label and text field
                SizedBox(
                  width: 220,
                  height: 50,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                      //  hintText: 'Enter your name',
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),

            // Add Preferred Location Rows here...

             SizedBox(height: 20),
            _buildLabel("   If preferred job location is not available \n   then are you willing to relocate?", isRequired: false),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _selectedGender,
                  onChanged: (value) => setState(() => _selectedGender = value),
                ),
                const Text("Yes", style: TextStyle(fontSize: 18)),
                const SizedBox(width: 40),
                Radio<String>(
                  value: 'No',
                  groupValue: _selectedGender,
                  onChanged: (value) => setState(() => _selectedGender = value),
                ),
                const Text("No", style: TextStyle(fontSize: 18)),
              ],
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Text("Work Availability (you can choose \n multiple options) *",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          value: fullTime,
                          onChanged: (value) {
                            setState(() {
                              fullTime = value!;
                            });
                          },
                        ),
                      ),
                      const Text("Full-Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                      const SizedBox(width: 30),
                      Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          value: partTime,
                          onChanged: (value) {
                            setState(() {
                              partTime = value!;
                            });
                          },
                        ),
                      ),
                      const Text("Part-Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ],
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: Checkbox(
                          value: oneTime,
                          onChanged: (value) {
                            setState(() {
                              oneTime = value!;
                            });
                          },
                        ),
                      ),
                      const Text("One-Time",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    ],
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
