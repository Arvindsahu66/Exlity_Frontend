/*

*/
/*

import 'package:code_exlity/OtpEnter.dart';
import 'package:flutter/cupertino.dart' show AssetImage;
import 'package:flutter/material.dart';

TextEditingController _phoneController = TextEditingController();


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key ? key}) : super(key :key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 200),
            Image.asset("assets/Group 1382.png",width: 350,height: 150,),
            Text("Create a New Account",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Text("Enter Phone Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500), ),
           // Text("employers immediately",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
            SizedBox(height: 10),
            SizedBox(
              width: 300,height: 70, // Adjust this value as needed
              child: TextField(
                controller: _phoneController, // <-- this line is important
                maxLength: 10,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/IndFlag.png', width: 30, height: 30),
                        SizedBox(width: 7),
                        Text("+91 -", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ),

            ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return Otpenter();}), );},
                child: Text("OTP via \n   SMS"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF006442),
                  foregroundColor: Colors.white,
                  minimumSize: Size(140, 60), // Reduced to fit side by side
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 16), // spacing between buttons
              ElevatedButton(
                onPressed: (){ },

                child: Text(" OTP via \n WhatsApp"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF006442),
                  side: BorderSide(color: Color(0xFF006442), width: 1),
                  minimumSize: Size(160, 60),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

            Spacer(),

            Text("By using Exlity, you agree and consent to our:"),
            Text("Terms of services, Cookie Policy, Privacy Policy.",style: TextStyle( decoration: TextDecoration.underline, ),),
            SizedBox(height: 10),
            Text("©2025 Exlity"),
            SizedBox(height: 50)
          ],

        ),
      ),
    );
  }
}
*/ /*





import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'otp_enter.dart'; // Make sure this file exists and has a valid OtpEnterPage widget

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _phoneController = TextEditingController();

  // Send OTP function
  Future<void> sendOtp(String phone, String channel) async {
    final url = Uri.parse("https://exlity-job-seeker-1.onrender.com");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'phone': '+91$phone',
          'channel': channel,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP sent successfully")),
        );

        // Navigate only on success
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpEnterPage(phone: '+91$phone'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  // Validates phone and sends OTP
  void _validateAndSend(String channel) {
    final phone = _phoneController.text.trim();
    if (phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone)) {
      sendOtp(phone, channel);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter a valid 10-digit phone number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Image.asset("assets/Group 1382.png", width: 350, height: 150),
            Text("Create a New Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Enter Phone Number", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 70,
              child: TextField(
                controller: _phoneController,
                maxLength: 10,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/IndFlag.png', width: 30, height: 30),
                        SizedBox(width: 7),
                        Text("+91 -", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _validateAndSend("sms");
                  },
                  child: Text("OTP via \n   SMS"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF006442),
                    foregroundColor: Colors.white,
                    minimumSize: Size(140, 60),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _validateAndSend("whatsapp");
                  },
                  child: Text(" OTP via \n WhatsApp"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF006442),
                    side: BorderSide(color: Color(0xFF006442), width: 1),
                    minimumSize: Size(160, 60),
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text("By using Exlity, you agree and consent to our:"),
            Text("Terms of services, Cookie Policy, Privacy Policy.", style: TextStyle(decoration: TextDecoration.underline)),
            SizedBox(height: 10),
            Text("©2025 Exlity"),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

*/
/*
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'otp_enter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _phone = TextEditingController();
  final _auth = AuthService();
  bool _loading = false;

  Future<void> _handleSend(String channel) async {
    final phone = _phone.text.trim();
    if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      _snack('Enter a valid 10‑digit phone number');
      return;
    }

    setState(() => _loading = true);
    try {
      await _auth.sendOtp(phone10: phone, channel: channel);
      _snack('OTP sent via $channel');
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OtpEnterPage(phone10: phone),
        ),
      );
    } catch (e) {
      _snack('Failed: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('assets/Group 1382.png', width: 300),
            const SizedBox(height: 20),
            const Text('Enter Phone Number', style: TextStyle(fontSize: 20)),
            SizedBox(
              width: 280,
              child: TextField(
                controller: _phone,
                keyboardType: TextInputType.number,
                maxLength: 13, // 91 + 10 digits
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter phone number (e.g. 919876543210)',
                  counterText: "", // hides the character counter
                ),
              ),
            ),

            const SizedBox(height: 10),
            if (_loading) const CircularProgressIndicator(),
            if (!_loading)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(label: 'OTP via\nSMS', onTap: () => _handleSend('sms')),
                  const SizedBox(width: 16),
                  _buildButton(
                    label: 'OTP via\nWhatsApp',
                    outlined: true,
                    onTap: () => _handleSend('whatsapp'),
                  ),
                ],
              ),
            const Spacer(),
            const Text('By using Exlity, you agree to our\nTerms | Cookie | Privacy'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildButton({
    required String label,
    required VoidCallback onTap,
    bool outlined = false,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(140, 60),
        backgroundColor: outlined ? Colors.white : const Color(0xFF006442),
        foregroundColor: outlined ? const Color(0xFF006442) : Colors.white,
        side: outlined ? const BorderSide(color: Color(0xFF006442)) : null,
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}
*/

/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'otp_enter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _phone = TextEditingController();

  // ------------------------------------------------------------------ //
  void _validateAndSend(String channel) {
    final raw = _phone.text.trim();      // user types 12 digits: 91xxxxxxxxxx

    final ok = raw.length == 12 &&
        raw.startsWith('91') &&
        RegExp(r'^\d{12}$').hasMatch(raw);

    if (ok) {
      final formattedPhone = '+$raw';     // "+91xxxxxxxxxx"
      _sendOtp(formattedPhone, channel);
    } else {
      _snack('Enter a 12‑digit number starting with 91');
    }
  }

  // ------------------------------------------------------------------ //
  Future<void> _sendOtp(String phone, String channel) async {
    final url = Uri.parse(
        'https://exlity-job-seeker-1.onrender.com/api/auth/send-otp');

    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone, 'channel': channel}),
      );

      if (res.statusCode == 200) {
        _snack('OTP sent ✔');
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OtpEnterPage(phone: phone)),
        );
      } else {
        _snack('Backend error: ${res.body}');
      }
    } catch (e) {
      _snack('Network error: $e');
    }
  }

  // ------------------------------------------------------------------ //
  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 180),
            Image.asset('assets/Group 1382.png', width: 320),
            const SizedBox(height: 24),
            const Text('Enter Phone Number',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            SizedBox(
              width: 280,
              child: TextField(
                controller: _phone,
                keyboardType: TextInputType.number,
                maxLength: 12,                       // 91 + 10 digits
                decoration: const InputDecoration(
                  hintText: 'e.g. 919876543210',
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBtn('OTP via\nSMS', 'sms', filled: true),
                const SizedBox(width: 14),
                _buildBtn('OTP via\nWhatsApp', 'whatsapp'),
              ],
            ),
            const Spacer(),
            const Text('By using Exlity you agree to our Terms & Policies'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildBtn(String label, String channel,
      {bool filled = false}) {
    return ElevatedButton(
      onPressed: () => _validateAndSend(channel),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 60),
        backgroundColor: filled ? const Color(0xFF006442) : Colors.white,
        foregroundColor: filled ? Colors.white : const Color(0xFF006442),
        side: filled ? null : const BorderSide(color: Color(0xFF006442)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}

import 'package:code_exlity/OtpEnter.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'OtpEnter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _phoneCtrl = TextEditingController();
  final _api = AuthService();
  bool _sending = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  // Validate → call /send-otp
  Future<void> _send(String channel) async {
    final raw = _phoneCtrl.text.trim(); // 12 digits: 91xxxxxxxxxx
    final ok = raw.length == 12 &&
        raw.startsWith('91') &&
        RegExp(r'^\d{12}$').hasMatch(raw);

    if (!ok) {
      _snack('Enter 12 digits starting with 91');
      return;
    }

    final e164 = '+$raw'; // +91xxxxxxxxxx – E.164 required by most providers

    setState(() => _sending = true);
    try {
      await _api.sendOtp(phone: e164, channel: channel);
      _snack('OTP sent via $channel');
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Otpenter()),
      );
    } catch (e) {
      _snack('Error: $e');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.number,
              maxLength: 12,
              decoration: const InputDecoration(
                labelText: 'Phone (start with 91)',
                hintText: '919876543210',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            const SizedBox(height: 24),
            _sending
                ? const CircularProgressIndicator()
                : Column(
              children: [
                ElevatedButton(
                  onPressed: () => _send('sms'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: const Color(0xFF006442),
                  ),
                  child: const Text('OTP via SMS'),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => _send('whatsapp'),
                  child: const Text('WhatsApp'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'otp_enter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _phoneCtrl = TextEditingController();
  final _api = AuthService();
  bool _sending = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _send(String channel) async {
    final raw = _phoneCtrl.text.trim();
    final ok = raw.length == 12 &&
        raw.startsWith('91') &&
        RegExp(r'^\d{12}$').hasMatch(raw);

    if (!ok) {
      _snack('Enter 12 digits starting with 91');
      return;
    }

    final e164 = '+$raw';

    setState(() => _sending = true);
    try {
      await _api.sendOtp(phone: e164, channel: channel);
      _snack('OTP sent via $channel');
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OtpEnterPage(phone: e164)),
      );
    } catch (e) {
      _snack('Error: $e');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.number,
              maxLength: 12,
              decoration: const InputDecoration(
                labelText: 'Phone (start with 91)',
                hintText: '919876543210',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            const SizedBox(height: 24),
            _sending
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => _send('sms'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          backgroundColor: const Color(0xFF006442),
                        ),
                        child: const Text('OTP via SMS'),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () => _send('whatsapp'),
                        child: const Text('WhatsApp'),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'otp_enter.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _phoneCtrl = TextEditingController();
  final _api = AuthService();
  bool _sending = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _send(String channel) async {
    final raw = _phoneCtrl.text.trim();
    if (raw.isEmpty || !RegExp(r'^\d{10}$').hasMatch(raw)) {
      _snack('Enter valid 10 digit phone number');
      return;
    }

    final phone = "+91$raw"; // always in E.164 format

    setState(() => _sending = true);
    try {
      await _api.sendOtp(phone: phone, channel: channel);
      _snack('OTP sent via $channel');
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OtpEnterPage(phone: phone)),
      );
    } catch (e) {
      _snack('Error: $e');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '9876543210',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            const SizedBox(height: 24),
            _sending
                ? const CircularProgressIndicator()
                : Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => _send('sms'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: const Color(0xFF006442),
                      ),
                      child: const Text('OTP via SMS'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () => _send('whatsapp'),
                      child: const Text('WhatsApp'),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
import 'package:code_exlity/otp_enter.dart';
import 'package:flutter/material.dart';
import 'package:code_exlity/services/api_service.dart';
import 'OtpPage.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _phoneCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    final raw = _phoneCtrl.text.trim();
    if (raw.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(raw)) {
      _snack("Enter a valid 10-digit phone number");
      return;
    }

    final phone = "+91$raw";

    setState(() => _loading = true);
    try {
      await ApiService().sendOtp(phone: phone);
      _snack("OTP sent to $phone ✅");
      if (!mounted) return;

      Navigator.push(context, MaterialPageRoute(builder: (_) => OTPPage)));
    } catch (e) {
      _snack("Send failed: $e");
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter your phone number to register",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                prefixText: "+91 ",
                hintText: "9876543210",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: _sendOtp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Send OTP"),
                ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:code_exlity/services/api_service.dart'; // import your ApiService file

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool _otpSent = false;
  bool _loading = false;

  // ---- Send OTP ----
  Future<void> sendOtp() async {
    if (_phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter phone number")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      print("📤 Sending OTP to: ${_phoneController.text}");
      await ApiService().sendOtp(phone: _phoneController.text);

      setState(() {
        _otpSent = true;
        _loading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("✅ OTP Sent Successfully")));
    } catch (e) {
      setState(() => _loading = false);
      print("❌ OTP Error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to send OTP: $e")));
    }
  }

  // ---- Verify OTP ----
  Future<void> verifyOtp() async {
    if (_otpController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter OTP")));
      return;
    }

    setState(() => _loading = true);

    try {
      print("📤 Verifying OTP for: ${_phoneController.text}");
      bool success = await ApiService().verifyOtp(
        phone: _phoneController.text,
        otp: _otpController.text,
      );

      setState(() => _loading = false);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ OTP Verified Successfully")),
        );
        // TODO: Navigate to next page
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("❌ OTP Invalid")));
      }
    } catch (e) {
      setState(() => _loading = false);
      print("❌ Verify OTP Error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Verification failed: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png", height: 80),
                const SizedBox(height: 10),

                const Text(
                  "Exlity",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),

                const Text(
                  "Create a New Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // Phone Number Input
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "Enter Phone Number",
                  ),
                ),

                const SizedBox(height: 20),

                // OTP Input (only if OTP is sent)
                if (_otpSent)
                  TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      labelText: "Enter OTP",
                    ),
                  ),

                const SizedBox(height: 20),

                // Request OTP Button
                if (!_otpSent)
                  ElevatedButton(
                    onPressed: _loading ? null : sendOtp,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    child:
                        _loading
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : const Text("Request OTP"),
                  ),

                // Verify OTP Button
                if (_otpSent)
                  ElevatedButton(
                    onPressed: _loading ? null : verifyOtp,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                    ),
                    child:
                        _loading
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : const Text("Verify OTP"),
                  ),

                const SizedBox(height: 20),

                if (_otpSent)
                  TextButton(
                    onPressed: _loading ? null : sendOtp,
                    child: const Text("Resend OTP"),
                  ),

                const SizedBox(height: 40),

                const Text(
                  "By using Exlity, you agree and consent to our:\nTerms of Service, Cookie Policy, Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 20),
                const Text(
                  "©2025 Exlity",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
