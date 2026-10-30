import 'package:flutter_application_1/features/profile/data/datasources/profile_datasource.dart';
import 'package:flutter_application_1/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_application_1/features/profile/domain/repositories/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final profileDataSourceProvider = Provider<ProfileDatasource>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return ProfileDatasourceImpl(supabase);
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref){
  final dataSource = ref.watch(profileDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
});

final profileControllerProvider = StateNotifierProvider<ProfileController, bool>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ProfileController(repository);
});

class ProfileController extends StateNotifier<bool> {
  final ProfileRepository _profileRepository;

  ProfileController(this._profileRepository) : super(false);

  Future<bool> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String direction,
    String? urlImage,
    required String bornDate,
  }) async {
    state = true;
    try {

      final currentUser = Supabase.instance.client.auth.currentUser;

      if(currentUser == null) {
        state = false;
        return false;
      }

      final userId = currentUser.id;

      await _profileRepository.updateProfile(
        userId: userId, 
        name: name, 
        email: email, 
        phone: phone, 
        direction: direction, 
        bornDate: bornDate
      );
      state = false;
      return true;
    } catch(e) {
      state = false;
      return false;
    }
  }
}