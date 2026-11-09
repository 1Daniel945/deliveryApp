class RestaurantcategoriesEntity {
  final String?id;
  final String name;
  final List<String> categories;

  const RestaurantcategoriesEntity({
    required this.id,
    required this.name,
    required this.categories,
  });
}