import 'package:flutter_application_1/features/restaurants/data/datasources/restaurant_datasource.dart';
import 'package:flutter_application_1/features/restaurants/data/models/restaurant_model.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImp extends RestaurantRepository {
  final RestaurantDatasource datasource;
  RestaurantRepositoryImp(this.datasource);

  @override
  Future<List<RestaurantEntity>> getRestaurants() async {
    try {
      final categories = await datasource.getRestaurants();
      return categories.map((category) => category as RestaurantEntity).toList();
    } catch(e) {
      throw Exception('Error al obtener los restaurantes: $e');
    }
  }
  
  @override
  Future<RestaurantModel?> getSpecificRestaurant(String restaurantId) async {
    try {
      final restaurant = await datasource.getSpecificRestaurant(restaurantId);
      return restaurant;
    } catch(e) {
      throw Exception('Error al obtener el restaurante: $restaurantId, $e');
    }
  }
}