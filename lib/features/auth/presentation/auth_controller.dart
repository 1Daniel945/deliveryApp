import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../data/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthController(repository);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(false);

  Future<bool> signUp({required String email, required String password, required String name, required String phone}) async {
    state = true;
    try {
      await _authRepository.signUp(email: email, password: password, name: name, phone: phone);
      state = false;
      return true;
    } catch(e) {
      //print('Error de supabase $e');
      state = false;
      return false;
    }
  }

  Future<void> signInWithGoogle() async {
    state = true;
    try {
      await _authRepository.signInWithGoogle();
    } catch(e) {
      rethrow;
    } finally {
      state = false;
    }
  }

  Future<void> signInWithPassword({required String email, required String password}) async {
    state = true;
    try {
      await _authRepository.signInWithPassword(
        email: email, 
        password: password,
      );
    } catch(e) {
      rethrow;
    } finally {
      state = false;
    }
  }

  Future<void> verifyOtp({required String email, required String token}) async {
    state = true;
    try {
      await _authRepository.verifyEmailOtp(email: email, token: token);
    } catch(e) {
      rethrow;
    } finally {
      state = false;
    }
  } 
}