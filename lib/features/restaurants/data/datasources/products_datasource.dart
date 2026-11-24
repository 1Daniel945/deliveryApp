import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductsDatasource {
  final SupabaseClient supabase;
  ProductsDatasource(this.supabase);

  Future<List<Map<String, dynamic>>> getRestaurantMenu(String restaurantId) async {
    try {
      final response = await supabase
        .from('restaurant')
        .select('''
          name,
          menu_categories (
            id,
            category_name,
            products (
              id,
              url_image_product,
              product_name,
              product_description,
              product_price,
              product_ingredients (ingredient_name),
              extra_ingredients (extra_name, extra_price)
            )
          )
        ''')
        .eq('id', restaurantId).maybeSingle();
        debugPrint('La respuesta de supabase sin modelar es: $response', wrapWidth: 1024);
        if(response == null) return [];
        return flatterResponse(response);//flatterResponse(response.length);
    } catch(e) {
      throw Exception('Error al cargar el menú del restaurante $e');
    }
  }

  List<Map<String, dynamic>> flatterResponse(Map<String, dynamic> data) {
    final List<Map<String, dynamic>> flattenedList = [];
    final restaurantName = data['name'] ?? '';
    final categories = data['menu_categories'] as List<dynamic>? ?? [];
    for(final rawCategory in categories) {
      final category = Map<String, dynamic>.from(rawCategory as Map);
      final categoryName = category['category_name']?.toString() ?? '';
      final products = category['products'] as List<dynamic>? ?? [];
      for(final rawProduct in products) {
        final product = Map<String, dynamic>.from(rawProduct as Map); 
        final ingredients = product['product_ingredients'] as List<dynamic>? ?? [];
        final ingredientList = ingredients
          .map((rawIng) {
            final ing = Map<String, dynamic>.from(rawIng as Map);
            return ing['ingredient_name']?.toString() ?? '';
          })
          .where((name) => name.isNotEmpty).join(', ');
        final extras = product['extra_ingredients'] as List<dynamic>? ?? [];
        flattenedList.add({
          'id': product['id'],
          'restaurant_name': restaurantName,
          'category_name': categoryName,
          'url_image_product': product['url_image_product'],
          'product_name': product['product_name'],
          'product_description': product['product_description'],
          'product_price': product['product_price'],
          'ingredients': ingredientList,
          'extras': extras,
        });
      }
    }
    //print('La respuesta plana es xddddd: $flattenedList');
    return flattenedList;
  } 
}