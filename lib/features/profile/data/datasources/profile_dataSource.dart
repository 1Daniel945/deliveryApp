import 'package:flutter_application_1/features/profile/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfileDatasource {
  Future<ProfileModel> getProfile(String userId);
  Future<ProfileModel> updateProfile({
    required String userId,
    required String name,
    required String email,
    required String phone,
    required String direction,
    String urlImage,
    required String bornDate,
  });
}

class ProfileDatasourceImpl implements ProfileDatasource {
  final SupabaseClient supabaseClient;

  ProfileDatasourceImpl(this.supabaseClient);

  @override
  Future<ProfileModel> getProfile(String userId) async {
    final response = await supabaseClient
      .from('profiles')
      .select()
      .eq('id', userId)
      .single();
    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> updateProfile({
    required String userId,
    required String name,
    required String email,
    required String phone,
    required String direction,
    String? urlImage,
    required String bornDate,
  }) async {
    final response = await supabaseClient
      .from('profiles')
      .update({
        'name': name,
        'email': email,
        'phone': phone,
        'direction': direction,
        'urlImage': urlImage,
        'bornDate': bornDate,
      })
      .eq('id', userId)
      .select()
      .single();
    return ProfileModel.fromJson(response);
  }
}