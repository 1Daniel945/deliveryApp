import 'package:flutter_application_1/features/restaurants/data/models/menu_categories_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MenuCategoriesDatasource {
  final SupabaseClient supabaseClient;

  MenuCategoriesDatasource(this.supabaseClient);

  Future<List<MenuCategoriesModel>>getCategories(String id) async {
    try {
      final response = await supabaseClient
        .from('menu_categories')
        .select()
        .eq('id_restaurant', id);

      final data = response as List<dynamic>;
      return (data)
        .map((json) => MenuCategoriesModel.fromMap((json))).toList();
    } catch(e) {
      throw Exception('Error al obtener las categorías $e');
    }
  }
}