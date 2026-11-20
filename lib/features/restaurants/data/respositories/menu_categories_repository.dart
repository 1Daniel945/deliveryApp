import 'package:flutter_application_1/features/restaurants/data/datasources/menu_categories_datasource.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/menu_categories_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/menu_categories_repository.dart';

class MenuCategoriesRepositoryImp extends MenuCategoriesRepository {
  final MenuCategoriesDatasource datasource;
  MenuCategoriesRepositoryImp(this.datasource);

  @override
  Future<List<MenuCategoriesEntity>> getCategories(String restaurantId) async {
    try {
      final models = await datasource.getCategories(restaurantId);
      return models;
    } catch(e) {
      throw Exception('Error en el repositorio al obtener categorias: $e');
    }
  }
}