/*
import 'dart:convert';
import 'package:http/http.dart' as http;

/// All remote‑auth logic lives here.
/// Keeps your UI widgets nice and light.
class AuthService {
  static const _base = 'https://exlity-job-seeker-1.onrender.com/api/auth';

  /// POST /send-otp
  Future<void> sendOtp({
    required String phone10,   // e.g. 9876543210
    required String channel,   // "sms" or "whatsapp"
  }) async {
    final res = await http.post(
      Uri.parse('$_base/send-otp'),
      headers: _json,
      body: jsonEncode({
        'phone': phone,     // NOT '+91$phone'
        'channel': channel, // either "sms" or "whatsapp"
      }),

    );
    _throwIfNot200(res);
  }

  /// POST /verify-otp
  Future<void> verifyOtp({
    required String phone10,
    required String otp,       // 4–6 digits
  }) async {
    final res = await http.post(
      Uri.parse('$_base/verify-otp'),
      headers: _json,
      body: jsonEncode({
        'phone': '+91$phone10',
        'otp': otp,
      }),
    );
    _throwIfNot200(res);
  }

  /// POST /resend-otp
  Future<void> resendOtp({
    required String phone10,
    required String channel,
  }) async {
    final res = await http.post(
      Uri.parse('$_base/resend-otp'),
      headers: _json,
      body: jsonEncode({
        'phone': phone,     // NOT '+91$phone'
        'channel': channel, // either "sms" or "whatsapp"
      }),
    );
    _throwIfNot200(res);
  }

  // --------------------------------------------------------------------------
  static const _json = {'Content-Type': 'application/json'};

  get phone => null;
  Never _throwIfNot200(http.Response res) {
    if (res.statusCode != 200) {
      throw Exception(
        '(${res.statusCode}) ${res.reasonPhrase}\n${res.body}',
      );
    }
    return throw UnimplementedError();
  }
}
*/

// Centralised helper for all auth‑related HTTP calls.
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Centralised wrapper around your Render API.
class AuthService {
  static const _base =
      'https://exlity-job-seeker-1.onrender.com/api/auth';

  Future<void> sendOtp({
    required String phone,   // "+91xxxxxxxxxx"
    required String channel, // "sms" | "whatsapp"
  }) =>
      _post('send-otp', {'phone': phone, 'channel': channel});

  Future<void> verifyOtp({
    required String phone,
    required String otp,
  }) =>
      _post('verify-otp', {'phone': phone, 'otp': otp});

  Future<void> resendOtp({
    required String phone,
    required String channel,
  }) =>
      _post('resend-otp', {'phone': phone, 'channel': channel});

  // ────────────────────────────────────────────────────────────────────
  Future<void> _post(String path, Map<String, dynamic> body) async {
    final res = await http.post(
      Uri.parse('$_base/$path'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (res.statusCode != 200) {
      throw Exception('(${res.statusCode}) ${res.body}');
    }
  }
}
