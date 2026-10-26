import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.direction,
    super.urlImage,
    required super.bornDate,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> mpJson) {
    return ProfileModel(
      id: mpJson['id'] as String, 
      name: mpJson['name'] as String? ?? '', 
      email: mpJson['email'] as String? ?? '', 
      phone: mpJson['phone'] as String? ?? '', 
      direction: mpJson['direction'] as String? ?? '',
      urlImage: mpJson['urlImage'] as String?, 
      bornDate: mpJson['bornDate'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'direction': direction,
      'urlImage': urlImage,
      'bornDate': bornDate,
    };
  }

  factory ProfileModel.fromEntity(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id, 
      name: entity.name, 
      email: entity.email, 
      phone: entity.phone, 
      direction: entity.direction, 
      bornDate: entity.bornDate,
    );
  }
}