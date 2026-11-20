import 'package:flutter_application_1/features/restaurants/domain/entities/menu_categories_entity.dart';

class MenuCategoriesModel extends MenuCategoriesEntity {
  MenuCategoriesModel({
    required super.id,
    required super.categoryName,
  });

  factory MenuCategoriesModel.fromMap(Map<String, dynamic> mp) {
    return MenuCategoriesModel(
      id: mp['id'] ?? '', 
      categoryName: mp['category_name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_name': categoryName,
    };
  }
}