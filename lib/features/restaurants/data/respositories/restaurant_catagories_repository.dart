import 'package:flutter_application_1/features/restaurants/data/datasources/restaurant_categories_datasource.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_categories_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/restaurant_categories_repository.dart';

class RestaurantcatagoriesRepositoryImp extends RestaurantCategoriesRepository {
  final RestaurantcategoriesDatasource datasource;
  RestaurantcatagoriesRepositoryImp(this.datasource);

  @override
  Future<List<RestaurantcategoriesEntity>> getCategories(String id) async {
    try {
      final categories = await datasource.getCategories(id);
      return categories.map((category) => category as RestaurantcategoriesEntity).toList();
    } catch(e) {
      throw Exception('Error al obtener las categorías: $e');
    }
  }
}