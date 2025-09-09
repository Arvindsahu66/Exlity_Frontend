import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Contactdetailpage extends StatelessWidget {
  const Contactdetailpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
       // selectedItemColor: greenColor,
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
              title: const Text("Contact Details", style: TextStyle(color: Colors.white)),
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
            _buildLabel("Mobile Number", isRequired: true),
            SizedBox(height: 10),
            TextField(keyboardType: TextInputType.number,

                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,

                ],decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter your mobile number",)),
            const SizedBox(height: 20),

            _buildLabel("WhatsApp Number", isRequired: true),
            SizedBox(height: 10),
             TextField(keyboardType: TextInputType.number,
                 inputFormatters: [
                   FilteringTextInputFormatter.digitsOnly,
                 ],decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter your Whatsapp number",)),
            const SizedBox(height: 20),

            _buildLabel("Email"),
            SizedBox(height: 10),
             TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: "123_xyz@gmail.com",)),
            const SizedBox(height: 20),




            SizedBox(height: 320),
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
