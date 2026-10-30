import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> signUp({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'display_name' : name,
          'phone': phone,
        },
      );
      return response;
    } catch(e) {
      throw Exception('Error en el registro: $e');
    }
  }

  Future<void> signInWithGoogle() async {
    await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'io.supabase.flutterquickstart://home',
    );
  }

  Future<void> verifyEmailOtp({required String email, required String token}) async {
    await supabase.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );
  }

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch(e) {
      rethrow;
    }
  }

  Map<String, String> getUserProfileData() {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if(user == null) return {'name': '', 'email': ''};
      return {
        'name': user.userMetadata?['display_name'] as String? ?? '',
        'email': user.email ?? '',
        'phone': user.userMetadata?['phone'] ?? '',
      };
    } catch(e) {
      throw Exception(e);
    }
  }

  Future<void> closeSesion() async {
    try {
      await supabase.auth.signOut();
    } catch(e) {
      throw Exception(e);
    }
  }

}