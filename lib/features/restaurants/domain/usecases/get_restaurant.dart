import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/restaurant_repository.dart';

class GetRestaurant {
  final RestaurantRepository repository;

  GetRestaurant(this.repository);

  Future<List<RestaurantEntity>> call() async {
    return await repository.getRestaurants();
  }
}