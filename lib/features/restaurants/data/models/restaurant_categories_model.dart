import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_categories_entity.dart';

class RestaurantCategoriesModel extends RestaurantcategoriesEntity{
  const RestaurantCategoriesModel({
    required super.id,
    required super.name,
    required super.categories,
  });

  factory RestaurantCategoriesModel.fromJson(Map<String, dynamic> mp) {
    var categories = mp['restaurant_category'] as List<dynamic>? ??[];
    
    List<String> categoriesList = categories.map((item) {
      return item['categories']['name'].toString();
    }).toList();

    return RestaurantCategoriesModel(
      id: mp['id'].toString(), 
      name: mp['name'] ?? '', 
      categories: categoriesList,
    );
  }
}