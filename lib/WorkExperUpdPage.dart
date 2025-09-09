import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Workexperupdpage extends StatelessWidget {
  const Workexperupdpage({super.key});

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
              title: const Text("Work Experience", style: TextStyle(color: Colors.white)),
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
            _buildLabel("Total Years of Experience*", isRequired: true),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: 1,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s,./-]')),
                LengthLimitingTextInputFormatter(20),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ex: 2 years or 6 months",
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Previous Employers & Job Roles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Employer \nName", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 22),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Role", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 67),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Time \nPeriod", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 48),
                SizedBox(
                  width: 220,
                  height: 50,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),

            SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Last Drawn Salary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                      //hintText: 'DD-MM-YYYY',
                    ),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10,),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                      hintText: 'Yearly',
                    ),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                /*
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 1),
                    child: Text("1st Preferred \n Location ",
                      style: TextStyle( fontSize: 18),
                    ),
                  ),

                  const SizedBox(width: 22),*/ // space between label and text field

                SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: TextField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                      hintText: 'Monthly',
                    ),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 70),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save & Exit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF006442),
                      side: const BorderSide(color: Color(0xFF006442), width: 1),
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Save & Next", style: TextStyle(fontSize: 16)),
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
