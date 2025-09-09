/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpEnterPage extends StatefulWidget {
  final String phone;

  const OtpEnterPage({Key? key, required this.phone}) : super(key: key);

  @override
  _OtpEnterPageState createState() => _OtpEnterPageState();
}

class _OtpEnterPageState extends State<OtpEnterPage> {
  final TextEditingController _otpController = TextEditingController();

  Future<void> verifyOtp() async {
    final url = Uri.parse("https://exlity-job-seeker.onrender.com/api/auth/verify-otp");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phone': widget.phone,
          'otp': _otpController.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login successful!")),
        );
        // Navigate to home or dashboard
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid OTP")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter OTP")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("OTP sent to ${widget.phone}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter OTP", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: verifyOtp,
              child: Text("Verify OTP"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF006442),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Otp_Page extends StatefulWidget {
//   @override
//   _Otp_PageState createState() => _Otp_PageState();
// }

// class _Otp_PageState extends State<Otp_Page> {
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();

//   bool isOtpSent = false;

//   // Replace with your backend URLs
//   final String sendOtpUrl =
//       "https://exlity-job-seeker.onrender.com/api/send-otp";
//   final String verifyOtpUrl =
//       "https://exlity-job-seeker.onrender.com/api/verify-otp";

//   Future<void> sendOtp() async {
//     if (phoneController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter phone number")),
//       );
//       return;
//     }

//     final response = await http.post(
//       Uri.parse(sendOtpUrl),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"phone": phoneController.text}),
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         isOtpSent = true;
//       });
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("OTP Sent ✅")));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to send OTP: ${response.body}")),
//       );
//     }
//   }

//   Future<void> verifyOtp() async {
//     if (otpController.text.isEmpty) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Please enter OTP")));
//       return;
//     }

//     final response = await http.post(
//       Uri.parse(verifyOtpUrl),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "phone": phoneController.text,
//         "otp": otpController.text,
//       }),
//     );

//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("OTP Verified ✅")));

//       // Navigate to next page after successful OTP verification
//       Navigator.pushNamed(context, "/home");
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Invalid OTP ❌ ${response.body}")));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),

//               // Logo
//               Column(
//                 children: [
//                   Image.asset("assets/logo.png", height: 80),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Exlity",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 40),

//               // Title
//               const Text(
//                 "Create a New Account",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Phone number field
//               TextField(
//                 controller: phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.phone, color: Colors.green),
//                   prefixText: "+91 ",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   hintText: "Enter Phone Number",
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // OTP field (always shown if OTP is sent)
//               if (isOtpSent) ...[
//                 TextField(
//                   controller: otpController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     hintText: "Enter OTP",
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],

//               // Buttons
//               if (!isOtpSent) ...[
//                 ElevatedButton(
//                   onPressed: sendOtp,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 12,
//                     ),
//                   ),
//                   child: const Text(
//                     "Send OTP",
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ] else ...[
//                 ElevatedButton(
//                   onPressed: verifyOtp,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 40,
//                       vertical: 12,
//                     ),
//                   ),
//                   child: const Text(
//                     "Verify OTP",
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: sendOtp,
//                   child: const Text(
//                     "Resend OTP",
//                     style: TextStyle(color: Colors.green),
//                   ),
//                 ),
//               ],

//               const SizedBox(height: 40),

//               // Footer
//               const Text(
//                 "By using Exlity, you agree and consent to our:\n"
//                 "Terms of Service, Cookie Policy, Privacy Policy.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 12, color: Colors.black54),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "©2025 Exlity",
//                 style: TextStyle(fontSize: 12, color: Colors.black54),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
