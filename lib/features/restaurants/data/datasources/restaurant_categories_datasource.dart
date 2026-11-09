import 'package:flutter_application_1/features/restaurants/data/models/restaurant_categories_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RestaurantcategoriesDatasource {
  final SupabaseClient supabaseClient;

  RestaurantcategoriesDatasource(this.supabaseClient);

  Future<List<RestaurantCategoriesModel>>getCategories(String id) async {
    try {
      final response = await Supabase.instance.client
        .from('restaurant')
        .select('''
          id,
          name,
          restaurant_category (
            categories (
              name
            )
          )
        ''').eq('id', id);

      final data = response as List<dynamic>;

      return (data)
        .map((json) => RestaurantCategoriesModel.fromJson(json)).toList();
    } catch(e) {
      throw Exception('Error al obtener las categorías $e');
    }
  }
}