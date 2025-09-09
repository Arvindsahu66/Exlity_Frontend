
import 'package:flutter/material.dart';
import 'auth_service.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage(this.phone, {super.key});
  final String phone;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final _otpCtrl = TextEditingController();
  final _auth = AuthService();
  bool _verifying = false;

  Future<void> _verify() async {
    final token = _otpCtrl.text.trim();
    if (token.length < 4) return;

    setState(() => _verifying = true);
    try {
      await _auth.verifyOtp(e164Phone: widget.phone, token: token);
      if (!mounted) return;
      Navigator.popUntil(context, (r) => r.isFirst); // AuthGate rebuilds
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid code: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _verifying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _otpCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: '6-digit code'),
              onSubmitted: (_) => _verify(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _verifying ? null : _verify,
              child: _verifying
                  ? const SizedBox.square(
                  dimension: 20, child: CircularProgressIndicator())
                  : const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'auth_service.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage(this.phone, {super.key});
  final String phone;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final _otpCtrl = TextEditingController();
  final _auth = AuthService();
  bool _verifying = false;

  Future<void> _verify() async {
    final token = _otpCtrl.text.trim();
    if (token.length < 4) return;

    setState(() => _verifying = true);
    try {
      await _auth.verifyOtp(e164Phone: widget.phone, token: token);
      if (!mounted) return;
      Navigator.popUntil(context, (r) => r.isFirst);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid code: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _verifying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150,),
                Image.asset('assets/Group 1381.png', height: 100,width: 350,), // Replace with your logo
                const SizedBox(height: 24),
                const Text(
                  "Create a New Account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter OTP",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _otpCtrl,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: 'X X X X X X',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "114s sec, resend via SMS/WA both",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _verifying ? null : _verify,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  ),
                  child: _verifying
                      ? const SizedBox.square(
                      dimension: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text("Resend OTP"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Back", style: TextStyle(color: Colors.red)),
                ),
                const Spacer(),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "By using Exlity, you agree and consent to our: "),
                      TextSpan(
                        text: "Terms of Service, Cookie Policy, Privacy Policy.",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                const Text("©2025 Exlity", style: TextStyle(fontSize: 12, color: Colors.black87)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
