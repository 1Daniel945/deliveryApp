import 'package:flutter_application_1/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile(String userId);
  Future<ProfileEntity> updateProfile({
    required String userId,
    required String name,
    required String email,
    required String phone,
    required String direction,
    String? urlImage,
    required String bornDate,
  });
}