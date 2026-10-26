class ProfileEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? urlImage;
  final String direction;
  final String bornDate;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.urlImage,
    required this.direction,
    required this.bornDate,
  });
}