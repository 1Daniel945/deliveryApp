class RestaurantEntity {
  final String id;
  final String name;
  final String urlLogo;
  final String urlBanner;
  final String closingTime;
  final String openTime;

  RestaurantEntity({
    required this.id,
    required this.name,
    required this.urlLogo,
    required this.urlBanner,
    required this.openTime,
    required this.closingTime,
  });
}