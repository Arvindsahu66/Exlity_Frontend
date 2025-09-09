import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// ① Send the OTP (SMS or WhatsApp, depending on project settings)
  Future<void> sendOtp(String e164Phone) =>
      _supabase.auth.signInWithOtp(phone: e164Phone);

  /// ② Verify the OTP the user typed
  Future<AuthResponse> verifyOtp({
    required String e164Phone,
    required String token,
  }) =>
      _supabase.auth.verifyOTP(
        phone: e164Phone,
        token: token,
        type: OtpType.sms, // keep “sms” even if using WhatsApp
      );

  /// ③ Sign-out
  Future<void> signOut() => _supabase.auth.signOut();

  /// ④ Convenience getter
  String? currentUserPhone() => _supabase.auth.currentUser?.phone;
}
