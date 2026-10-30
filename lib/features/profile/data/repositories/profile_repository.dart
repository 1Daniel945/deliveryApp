import 'package:flutter_application_1/features/profile/data/datasources/profile_datasource.dart';
import 'package:flutter_application_1/features/profile/domain/entities/profile_entity.dart';
import 'package:flutter_application_1/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;
  ProfileRepositoryImpl(this.datasource);

  @override
  Future<ProfileEntity> getProfile(String userId) async {
    try {
      final profileModel = await datasource.getProfile(userId);
      return profileModel;
    } catch(e) {
      throw Exception('Error al obtener el perfil: ${e.toString()}');
    }
  }

  @override
  Future<ProfileEntity> updateProfile({
    required String userId,
    required String name,
    required String email,
    required String phone,
    required String direction,
    String? urlImage,
    required String bornDate,
  }) async {
    try {
      final profileModel = await datasource.updateProfile(
        userId: userId, 
        name: name, 
        email: email, 
        phone: phone, 
        direction: direction, 
        bornDate: bornDate,
      );
      return profileModel;
    } catch(e) {
      throw Exception('Error al actualizar el perfil: ${e.toString()}');
    }
  }
}