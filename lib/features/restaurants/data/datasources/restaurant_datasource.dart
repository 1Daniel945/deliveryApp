import 'package:flutter_application_1/features/restaurants/data/models/restaurant_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RestaurantDatasource {
  final SupabaseClient supabaseClient;
  RestaurantDatasource(this.supabaseClient);
  Future<List<RestaurantModel>> getRestaurants() async {
    final response = await supabaseClient
      .from('restaurant')
      .select();

    return (response as List<dynamic>)
      .map((json) => RestaurantModel.fromJson(json))
      .toList();
  }

  Future<RestaurantModel?> getSpecificRestaurant(String restaurantId) async {
    try {
      final response = await supabaseClient
        .from('restaurant')
        .select()
        .eq('id', restaurantId)
        .maybeSingle();
      if(response == null) return null;
      return RestaurantModel.fromJson(response);
    } catch(e) {
      throw Exception('Error al obtener el restaurante: $e');
    }
  }
}