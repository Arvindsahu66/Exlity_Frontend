/*
import 'package:code_exlity/Authentication/Verify_otp_page.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'Verify_otp_page.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final _controller = TextEditingController();          // +91…
  final _auth = AuthService();
  bool _sending = false;

  Future<void> _requestOtp() async {
    final phone = _controller.text.trim();
    if (phone.isEmpty || !phone.startsWith('+')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter phone in E.164 format (e.g. +919876543210)')),
      );
      return;
    }

    setState(() => _sending = true);
    try {
      await _auth.sendOtp(phone);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => VerifyOtpPage(phone)),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Couldn’t send OTP: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter phone')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone (+CountryCodeNumber)',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _sending ? null : _requestOtp,
              child: _sending
                  ? const SizedBox.square(
                  dimension: 20, child: CircularProgressIndicator())
                  : const Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'Verify_otp_page.dart';
import 'auth_service.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final _controller = TextEditingController();
  final _auth = AuthService();
  bool _sending = false;

  Future<void> _requestOtp({required bool viaWhatsApp}) async {
    final phone = '+91${_controller.text.trim()}';
    if (_controller.text.trim().isEmpty || _controller.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit phone number')),
      );
      return;
    }

    setState(() => _sending = true);
    try {
      await _auth.sendOtp(phone); // You can use `viaWhatsApp` as needed
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => VerifyOtpPage(phone)),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Couldn’t send OTP: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 160),
              // Logo
              Image.asset('assets/Group 1382.png', height: 100, width: 350), // Your logo path
              const SizedBox(height: 8),
              // Heading
              const Text(
                'Create a New Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Enter Phone Number'),
              ),
              const SizedBox(height: 8),
              // Phone Input Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Text('🇮🇳'),
                    const SizedBox(width: 8),
                    const Text('+91'),
                    const SizedBox(width: 8),
                    const VerticalDivider(),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'X X X X X X X X X X',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // OTP Buttons in Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 130, // Reduced width
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006442),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: _sending ? null : () => _requestOtp(viaWhatsApp: false),
                      child: _sending
                          ? const SizedBox(
                        height: 20, width: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                          : const Text('OTP via\nSMS', textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 130, // Reduced width
                    height: 55,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF006442)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      onPressed: _sending ? null : () => _requestOtp(viaWhatsApp: true),
                      child: const Text(
                        'OTP via\nWhatsApp',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF006442)),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),
              // Consent & Footer

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                children: const [
                  Text("By using Exlity, you agree and consent to our:"),
                  Text("Terms of services, Cookie Policy, Privacy Policy.",style: TextStyle( decoration: TextDecoration.underline, ),),
                  SizedBox(height: 10),
                  Text("©2025 Exlity"),
                  SizedBox(height: 50)],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

