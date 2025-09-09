/*
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:5000/api"; // change if needed

  // -------- AUTH --------
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _saveToken(data["token"]); // save token
      return data;
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }

  // -------- CITIES --------
  static Future<List<dynamic>> getCities() async {
    final url = Uri.parse("$baseUrl/cities");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load cities");
    }
  }

  // -------- SKILLS --------
  static Future<List<dynamic>> getSkills() async {
    final url = Uri.parse("$baseUrl/skills");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load skills");
    }
  }

  // -------- LANGUAGES --------
  static Future<List<dynamic>> getLanguages() async {
    final url = Uri.parse("$baseUrl/languages");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load languages");
    }
  }

  // -------- JOB LISTINGS --------
  static Future<List<dynamic>> getJobListings() async {
    final url = Uri.parse("$baseUrl/job-listings");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load jobs");
    }
  }

  // -------- SEARCH JOBS --------
  static Future<List<dynamic>> searchJobs(String keyword) async {
    final url = Uri.parse("$baseUrl/search-jobs?keyword=$keyword");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to search jobs");
    }
  }

  // -------- UTILITIES (TOKEN STORAGE) --------
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token"
    };
  }
}
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl =
      "https://exlity-master.onrender.com/api"; // backend base url

  // -------- AUTH --------
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/auth/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data["token"] != null) {
        await _saveToken(data["token"]);
      }

      return data;
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }

  // -------- BASIC DETAILS --------
  static Future<Map<String, dynamic>> saveBasicDetails({
    required String name,
    required String dob,
    required String gender,
    required String email,
  }) async {
    final url = Uri.parse("$baseUrl/basic-details/"); // ✅ fixed with slash
    final response = await http.put(
      url,
      headers: await _getHeaders(),
      body: jsonEncode({
        "name": name,
        "dob": dob,
        "gender": gender,
        "email": email,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to save basic details: ${response.body}");
    }
  }

  // -------- CITIES --------
  static Future<List<String>> getCities() async {
    final url = Uri.parse("$baseUrl/cities/all");
    final response = await http.get(url, headers: await _getHeaders());

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body is List && body.isNotEmpty && body.first is Map) {
        return (body as List)
            .map<String>((city) => city["name"].toString())
            .toList();
      }
      return List<String>.from(body);
    } else {
      throw Exception("Failed to load cities: ${response.body}");
    }
  }

  // -------- LOCATIONS --------
  static Future<List<dynamic>> getLocations() async {
    final url = Uri.parse("$baseUrl/locations");
    final response = await http.get(url, headers: await _getHeaders());

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load locations: ${response.body}");
    }
  }

  // -------- SKILLS --------
  static Future<List<String>> getSkills() async {
    final url = Uri.parse("$baseUrl/skills");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load skills: ${response.body}");
    }
  }

  // -------- LANGUAGES --------
  static Future<List<String>> getLanguages() async {
    final url = Uri.parse("$baseUrl/languages");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load languages: ${response.body}");
    }
  }

  // -------- JOB LISTINGS --------
  static Future<List<dynamic>> getJobListings() async {
    final url = Uri.parse("$baseUrl/job-listings");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load jobs: ${response.body}");
    }
  }

  // -------- SEARCH JOBS --------
  static Future<List<dynamic>> searchJobs(String keyword) async {
    final url = Uri.parse("$baseUrl/search-jobs?keyword=$keyword");
    final response = await http.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to search jobs: ${response.body}");
    }
  }

  // -------- UTILITIES --------
  static Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  // -------- OTP --------

  // /// Send OTP
  // Future<void> sendOtp({required String phone, required String channel}) async {
  //   final url = Uri.parse("$baseUrl/auth/send-otp"); // ✅ fixed route
  //   final response = await http.post(
  //     url,
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"phone": phone, "channel": channel}),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception("Failed to send OTP: ${response.body}");
  //   }
  // }

  // /// Verify OTP
  // Future<bool> verifyOtp({required String phone, required String otp}) async {
  //   final url = Uri.parse("$baseUrl/auth/verify-otp"); // ✅ correct
  //   final response = await http.post(
  //     url,
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"phone": phone, "otp": otp}),
  //   );

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return data["success"] == true;
  //   } else {
  //     throw Exception("Failed to verify OTP: ${response.body}");
  //   }
  // }

  // /// Resend OTP
  // Future<void> resendOtp({
  //   required String phone,
  //   String channel = "sms",
  // }) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/auth/resend-otp'), // ✅ correct
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({"phone": phone, "channel": channel}),
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception("Failed to resend OTP: ${response.body}");
  //   }
  // }
  // -------- OTP --------

  // Send OTP
  Future<void> sendOtp({required String phone}) async {
    final url = Uri.parse("$baseUrl/auth/otp/send");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to send OTP: ${response.body}");
    }
  }

  // Verify OTP
  Future<bool> verifyOtp({required String phone, required String otp}) async {
    final url = Uri.parse("$baseUrl/auth/otp/verify");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone, "otp": otp}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return true;
      // return data["success"] == true;
    } else {
      throw Exception("Failed to verify OTP: ${response.body}");
    }
  }

  // Resend OTP
  Future<void> resendOtp({required String phone}) async {
    final url = Uri.parse("$baseUrl/auth/otp/send"); // usually same as send
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phone": phone}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to resend OTP: ${response.body}");
    }
  }
}
