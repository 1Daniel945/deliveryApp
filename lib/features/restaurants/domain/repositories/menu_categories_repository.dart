import 'package:flutter_application_1/features/restaurants/domain/entities/menu_categories_entity.dart';

abstract class MenuCategoriesRepository {
  Future<List<MenuCategoriesEntity>>getCategories(String restaurantId);
}