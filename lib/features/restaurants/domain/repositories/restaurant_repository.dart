import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_entity.dart';

abstract class RestaurantRepository {
  Future<List<RestaurantEntity>>getRestaurants();
}