import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  RestaurantModel({
    required super.id,
    required super.name,
    required super.urlLogo,
    required super.urlBanner,
    required super.openTime,
    required super.closingTime,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> mp) {
    return RestaurantModel(
      id: mp['id']?.toString() ?? '', 
      name: mp['name']?.toString() ?? '',
      urlLogo: mp['url_logo']?.toString() ?? '',
      urlBanner: mp['url_banner']?.toString() ?? '',
      openTime: mp['closing_time']?.toString() ?? '',
      closingTime: mp['open_time']?.toString() ?? '',
    );
  }
}