import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_categories_entity.dart';

abstract class RestaurantCategoriesRepository {
  Future<List<RestaurantcategoriesEntity>>getCategories(String id);
}