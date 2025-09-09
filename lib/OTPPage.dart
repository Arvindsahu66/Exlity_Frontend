// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:code_exlity/services/api_service.dart';

// class OTPPage extends StatefulWidget {
//   final String phone;
//   const OTPPage({Key? key, required this.phone}) : super(key: key);

//   @override
//   State<OTPPage> createState() => _OTPPageState();
// }

// class _OTPPageState extends State<OTPPage> {
//   late TextEditingController _phoneCtrl;
//   final TextEditingController _otpCtrl = TextEditingController();

//   bool _loading = false;
//   bool _otpSent = false;
//   int _cooldown = 0;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _phoneCtrl = TextEditingController(text: widget.phone);
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _phoneCtrl.dispose();
//     _otpCtrl.dispose();
//     super.dispose();
//   }

//   void _startCooldown() {
//     setState(() => _cooldown = 60);
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (t) {
//       if (_cooldown <= 1) {
//         t.cancel();
//         setState(() => _cooldown = 0);
//       } else {
//         setState(() => _cooldown--);
//       }
//     });
//   }

//   Future<void> _sendOtp() async {
//     final phone = _phoneCtrl.text.trim();
//     if (phone.isEmpty || phone.length < 10) {
//       _showSnack("Enter a valid phone number");
//       return;
//     }

//     setState(() => _loading = true);
//     try {
//       await ApiService().sendOtp(phone: phone);
//       _showSnack("OTP sent ✅");
//       setState(() => _otpSent = true);
//       _startCooldown();
//     } catch (e) {
//       _showSnack("Send failed: $e");
//     } finally {
//       if (mounted) setState(() => _loading = false);
//     }
//   }

//   Future<void> _verifyOtp() async {
//     final phone = _phoneCtrl.text.trim();
//     final otp = _otpCtrl.text.trim();

//     if (otp.length < 4 || otp.length > 6) {
//       _showSnack("Enter a valid 4–6 digit OTP");
//       return;
//     }

//     setState(() => _loading = true);
//     try {
//       final success = await ApiService().verifyOtp(phone: phone, otp: otp);
//       if (success) {
//         _showSnack("OTP Verified ✅");
//         if (mounted) {
//           Navigator.pushReplacementNamed(context, "/home");
//         }
//       } else {
//         _showSnack("Invalid OTP ❌");
//       }
//     } catch (e) {
//       _showSnack("Verification failed: $e");
//     } finally {
//       if (mounted) setState(() => _loading = false);
//     }
//   }

//   Future<void> _resendOtp() async {
//     final phone = _phoneCtrl.text.trim();
//     if (phone.isEmpty) {
//       _showSnack("Enter phone number first");
//       return;
//     }

//     try {
//       await ApiService().resendOtp(phone: phone, channel: "sms");
//       _showSnack("OTP resent via SMS");
//       _startCooldown();
//     } catch (e) {
//       _showSnack("Resend failed: $e");
//     }
//   }

//   void _showSnack(String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Enter OTP")),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Phone number input
//             TextField(
//               controller: _phoneCtrl,
//               keyboardType: TextInputType.phone,
//               decoration: const InputDecoration(
//                 prefixText: "+91 ",
//                 hintText: "Enter Phone Number",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // OTP input (shown only after OTP sent)
//             if (_otpSent) ...[
//               TextField(
//                 controller: _otpCtrl,
//                 keyboardType: TextInputType.number,
//                 maxLength: 6,
//                 textAlign: TextAlign.center,
//                 decoration: const InputDecoration(
//                   hintText: "Enter OTP",
//                   border: OutlineInputBorder(),
//                   counterText: "",
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],

//             // Buttons
//             _loading
//                 ? const CircularProgressIndicator()
//                 : !_otpSent
//                 ? ElevatedButton(
//                   onPressed: _sendOtp,
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(48),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text("Send OTP"),
//                 )
//                 : ElevatedButton(
//                   onPressed: _verifyOtp,
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(48),
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text("Verify OTP"),
//                 ),

//             const SizedBox(height: 20),

//             if (_otpSent)
//               _cooldown == 0
//                   ? TextButton(
//                     onPressed: _resendOtp,
//                     child: const Text("Resend OTP"),
//                   )
//                   : Text(
//                     "Resend available in $_cooldown s",
//                     style: const TextStyle(color: Colors.grey),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
