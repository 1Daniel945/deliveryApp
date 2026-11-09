import 'package:supabase_flutter/supabase_flutter.dart';

class RestaurantFavorites {

  Future<bool> isFavorite(String restaurantId) async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if(userId == null) return false;
      final response = await Supabase.instance.client
        .from('user_favorites')
        .select('restaurant_id')
        .eq('user_id', userId)
        .eq('restaurant_id', restaurantId).maybeSingle();
      return response != null;
    } catch(e) {
      return false;
    }
  }
}