/*
import 'package:code_exlity/LocationPage.dart';
import 'package:code_exlity/PrefLocationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Personalinfo extends StatefulWidget {
  const Personalinfo({super.key});

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  String? _selectedGender; // Declare the _selectedGender variable

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wp.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset("assets/Group 1382.png", width: 300, height: 150),
              Text(
                "Fill your Personal Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF006442)),
              ),
              SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text("Full Name *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  maxLength: 30,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: '',

                    hintText: 'Enter your name',
                  ),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text("Date Of Birth", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),

              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  maxLength: 30,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: '',
                    hintText: 'DD-MM-YYYY',
                  ),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              // Gender selection
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Text("Gender", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align the content to the left by default
                    children: [
                      SizedBox(width: 40), // Adds a little space from the left edge
                      Radio<String>(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      Text('Male'),
                      SizedBox(width: 20),
                      Radio<String>(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 330,
                height: 50,
                child: TextField(
                  maxLength: 30,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: '',
                    hintText: 'Enter your Email',
                  ),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Spacer(),

              ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context){return Preflocationpage();}), );}, child:Text("Continue",style: TextStyle(fontSize: 18), ),style:  ElevatedButton.styleFrom(backgroundColor: Color(0xFF006442),
                foregroundColor: Colors.white,
                minimumSize: Size(300, 60),),),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:code_exlity/PrefLocationPage.dart';
import 'package:code_exlity/services/api_service.dart';
import 'package:flutter/material.dart';

class Personalinfo extends StatefulWidget {
  const Personalinfo({super.key});

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {
  String? _selectedGender;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _loading = false;

  // -------- Submit Details --------
  Future<void> _submitDetails() async {
    if (_nameController.text.isEmpty ||
        _dobController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("⚠️ Please fill all required fields")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      await ApiService.saveBasicDetails(
        name: _nameController.text.trim(),
        dob: _dobController.text.trim(),
        gender: _selectedGender!,
        email: _emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Details saved successfully")),
      );

      // Navigate to PrefLocationPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Preflocationpage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("❌ Error: $e")));
    } finally {
      setState(() => _loading = false);
    }
  }

  // -------- UI --------
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wp.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset("assets/Group 1382.png", width: 300, height: 150),
                const Text(
                  "Fill your Personal Information",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF006442),
                  ),
                ),
                const SizedBox(height: 10),

                // Full Name
                _buildLabel("Full Name *"),
                _buildTextField(_nameController, "Enter your name"),

                // DOB
                _buildLabel("Date Of Birth *"),
                _buildTextField(_dobController, "DD-MM-YYYY"),

                // Gender
                _buildLabel("Gender *"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged:
                          (value) => setState(() => _selectedGender = value),
                    ),
                    const Text('Male'),
                    Radio<String>(
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged:
                          (value) => setState(() => _selectedGender = value),
                    ),
                    const Text('Female'),
                  ],
                ),

                // Email
                _buildLabel("Email *"),
                _buildTextField(_emailController, "Enter your Email"),

                const SizedBox(height: 30),

                // Submit Button
                ElevatedButton(
                  onPressed: _loading ? null : _submitDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006442),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(300, 60),
                  ),
                  child:
                      _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            "Continue",
                            style: TextStyle(fontSize: 18),
                          ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 60, top: 10),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
