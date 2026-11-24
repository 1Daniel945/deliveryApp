import 'package:flutter_application_1/features/restaurants/data/models/extras_model.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity{
  ProductModel({
    required super.id,
    required super.urlImage,
    required super.productName,
    required super.categoryName,
    required super.productDescription,
    required super.productPrice,
    required super.ingredients,
    required super.extras,
  });

  factory ProductModel.fromJson(Map<String, dynamic> mp) {
    return ProductModel(
      id: mp['id']?.toString() ?? '', 
      urlImage: mp['url_image_product']?.toString() ?? '',
      productName: mp['product_name']?.toString() ?? '',
      categoryName: mp['category_name']?.toString() ?? '',
      productDescription: mp['product_description']?.toString() ?? '',
      productPrice: mp['product_price'] ?? 0,
      ingredients: mp['ingredients'] != null ? (mp['ingredients'] as String).split(', ') : [],
      extras: (mp['extras'] as List<dynamic>? ?? [])
        .map((extra) => ExtrasModel.fromJson(
          Map<String, dynamic>.from(extra),
        ))
        .toList(),
    );
  }
}