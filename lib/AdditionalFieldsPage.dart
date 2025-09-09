import 'package:code_exlity/ResumePage.dart';
import 'package:flutter/material.dart';

class Additionalfieldspage extends StatefulWidget {
  const Additionalfieldspage({super.key});

  @override
  State<Additionalfieldspage> createState() => _AdditionalfieldspageState();
}

class _AdditionalfieldspageState extends State<Additionalfieldspage> {
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
              child: Image.asset(
                'assets/Green.png',
                fit: BoxFit.cover,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text("Additional Fields", style: TextStyle(color: Colors.white)),
              leading: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Video Profile Section Row-wise
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left: Text and Instructions
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Video Profile*", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(
                        "Instructions:-\nMake a 30 seconds video, sharing about\nyour name, years of work and ...........",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),

                // Right: Video container with edit button
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Referral Code Section
            const Text("Referral Code (Earn money by inviting others)", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: "EXL009521AC",
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    // Copy code logic
                  },
                )
              ],
            ),
            const SizedBox(height: 20),

            // Resume Section
            const Text("Your Resume", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Center(
              child:ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return Resumepage();}), );}, child:Text("View",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
              foregroundColor: Colors.white,
              minimumSize: Size(300, 40),),),
            ),
            const Spacer(),

            // Save & Exit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006442),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                ),
                child: const Text("Save & Exit",style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
