import 'package:flutter_application_1/features/restaurants/data/models/restaurant_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RestaurantDatasource {
  Future<List<RestaurantModel>> getRestaurants() async {
    final response = await Supabase.instance.client
      .from('restaurant')
      .select();

    return (response as List<dynamic>)
      .map((json) => RestaurantModel.fromJson(json))
      .toList();
  }
}