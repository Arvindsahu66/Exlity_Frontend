import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class IdentificationCompliancePage extends StatefulWidget {
  const IdentificationCompliancePage({super.key});

  @override
  State<IdentificationCompliancePage> createState() =>
      _IdentificationCompliancePageState();
}

class _IdentificationCompliancePageState
    extends State<IdentificationCompliancePage> {
  int _selectedIndex = 3;
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _certificateController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  String? _policeStatus;
  XFile? _aadharImage;
  XFile? _panImage;
  XFile? _policeImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(Function(XFile) onImagePicked) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onImagePicked(image);
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add page navigation logic here if needed
    });
  }

  Widget buildUploadButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF006442),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
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
              title: const Text("Identification & Compliance", style: TextStyle(color: Colors.white)),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Aadhar Number*", style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
              child: TextField(
                controller: _aadharController,
                decoration: const InputDecoration(
                  hintText: "Enter Aadhar Number",
                  border: OutlineInputBorder(), // optional for better visuals
                ),
              ),
            ),
           // const SizedBox(height: 10),
            buildUploadButton("Upload Document Photo", () {
              _pickImage((image) {
                setState(() => _aadharImage = image);
              });
            }),

            const SizedBox(height: 20),
            const Text("PAN Number*", style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
              child: TextField(
                controller: _aadharController,
                decoration: const InputDecoration(
                  hintText: "Enter Pan Number ",
                  border: OutlineInputBorder(), // optional for better visuals
                ),
              ),
            ),

            //const SizedBox(height: 10),
            buildUploadButton("Upload Document Photo", () {
              _pickImage((image) {
                setState(() => _panImage = image);
              });
            }),

            const SizedBox(height: 20),
            const Text("Police Verification Status", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: _policeStatus,
                  onChanged: (val) => setState(() => _policeStatus = val),
                ),
                const Text("Yes"),
                const SizedBox(width: 70),
                Radio<String>(
                  value: 'No',
                  groupValue: _policeStatus,
                  onChanged: (val) => setState(() => _policeStatus = val),
                ),
                const Text("No"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
              child: TextField(
                controller: _aadharController,
                decoration: const InputDecoration(
                  hintText: "Enter Certificate Number (if yes)",
                  border: OutlineInputBorder(), // optional for better visuals
                ),
              ),
            ),

            //const SizedBox(height: 10),
            buildUploadButton("Upload Document Photo", () {
              _pickImage((image) {
                setState(() => _aadharImage = image);
              });
            }),
            SizedBox(height: 20),
            Text("Enter Bank Accound Detail",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            if (_policeStatus == 'Yes') ...[
              TextField(
                controller: _certificateController,
                decoration: const InputDecoration(
                  hintText: "Enter Certificate Number (if yes)",
                ),
              ),
              const SizedBox(height: 10),
              buildUploadButton("Upload Document Photo", () {
                _pickImage((image) {
                  setState(() => _policeImage = image);
                });
              }),
            ],

            const SizedBox(height: 20),

            Row(
              children: [
                const Text("Account\nNumber",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 30),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
                    child: TextField(
                      controller: _aadharController,
                      decoration: const InputDecoration(
                        hintText: "Enter Account Number",
                        border: OutlineInputBorder(), // optional for better visuals
                      ),
                    ),
                  ),

                ),
              ],
            ),
            SizedBox(height: 1,),
            Row(
              children: [
                const Text("IFSC Code",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 17),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
                    child: TextField(
                      controller: _aadharController,
                      decoration: const InputDecoration(
                        hintText: "Enter IFSC Number",
                        border: OutlineInputBorder(), // optional for better visuals
                      ),
                    ),
                  ),

                ),
              ],
            ),
            SizedBox(height: 1,),
            Row(
              children: [
                const Text("Bank \nName",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 45),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
                    child: TextField(
                      controller: _aadharController,
                      decoration: const InputDecoration(
                        hintText: "Enter Bank Name",
                        border: OutlineInputBorder(), // optional for better visuals
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            const Text("ESI Details*", style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
              child: TextField(
                controller: _aadharController,
                decoration: const InputDecoration(
                 // hintText: "Enter Aadhar Number",
                  border: OutlineInputBorder(), // optional for better visuals
                ),
              ),
            ),

            SizedBox(height: 20,),

            const Text("PF Details*", style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0), // top & bottom padding
              child: TextField(
                controller: _aadharController,
                decoration: const InputDecoration(
                //  hintText: "Enter Aadhar Number",
                  border: OutlineInputBorder(), // optional for better visuals
                ),
              ),
            ),



            const SizedBox(height: 30),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for Save & Exit
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF006442),
                    side: const BorderSide(color: Color(0xFF006442)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Save & Exit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for Save & Next
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006442),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Save & Next"),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
