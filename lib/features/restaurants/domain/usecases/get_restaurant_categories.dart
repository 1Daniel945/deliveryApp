import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_categories_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/restaurant_categories_repository.dart';

class GetRestaurantCategories {
  final RestaurantCategoriesRepository repository;

  GetRestaurantCategories(this.repository);

  Future<List<RestaurantcategoriesEntity>> call(String restaurantId) async {
    return await repository.getCategories(restaurantId);
  }
}