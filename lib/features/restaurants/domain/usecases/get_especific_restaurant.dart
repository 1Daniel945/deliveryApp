import 'package:flutter_application_1/features/restaurants/data/models/restaurant_model.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/restaurant_repository.dart';

class GetSpecificRestaurant {
  final RestaurantRepository repository;

  GetSpecificRestaurant(this.repository);

  Future<RestaurantModel?> call(String restaurantId) async {
    return await repository.getSpecificRestaurant(restaurantId);
  }
}

