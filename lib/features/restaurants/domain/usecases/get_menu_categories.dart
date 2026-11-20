import 'package:flutter_application_1/features/restaurants/domain/entities/menu_categories_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/menu_categories_repository.dart';

class GetMenuCategories {
  final MenuCategoriesRepository repository;

  GetMenuCategories(this.repository);

  Future<List<MenuCategoriesEntity>> call(String restaurantId) async {
    return await repository.getCategories(restaurantId);
  }
}