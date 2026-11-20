import 'package:flutter_application_1/features/restaurants/data/models/restaurant_model.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_entity.dart';

abstract class RestaurantRepository {
  Future<List<RestaurantEntity>>getRestaurants();
  Future<RestaurantModel?>getSpecificRestaurant(String restaurantId);
}