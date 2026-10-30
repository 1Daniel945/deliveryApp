import 'package:flutter_application_1/features/home/domain/entities/categories.dart';

class CategoryModel extends CategoriesEntity{
  
  CategoryModel({
    required super.id,
    required super.name,
    required super.imageurl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'], 
      name: json['name'],
      imageurl: json['imageurl'] as String,
    );
  }

}