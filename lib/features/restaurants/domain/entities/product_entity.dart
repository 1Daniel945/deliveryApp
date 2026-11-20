import 'package:flutter_application_1/features/restaurants/data/models/extras_model.dart';

class ProductEntity {
  final String id;
  final String urlImage;
  final String productName;
  final String productDescription;
  final int productPrice;
  final List<String> ingredients;
  final List<ExtrasModel> extras;

  ProductEntity({
    required this.id,
    required this.urlImage,
    required this. productName,
    required this.productDescription,
    required this.productPrice,
    required this.ingredients,
    required this.extras,
  });
}