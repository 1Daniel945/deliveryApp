import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteRestaurantNotifier extends StateNotifier<bool> {
  final String restaurantId;
  final SupabaseClient _supabase = Supabase.instance.client;

  FavoriteRestaurantNotifier(this.restaurantId) : super(false) {
    checkInitialFavoriteStatus();
  }

  Future<void> checkInitialFavoriteStatus() async {
    final previousState = state;
    state = !state; 
    try {
      final userId = supabase.auth.currentUser?.id;
      if(userId == null) return;

      final response = await supabase.from('user_favorites')
        .select()
        .eq('user_id', userId)
        .eq('restaurant_id', restaurantId)
        .maybeSingle();

      if(response != null) {
        state = true;
      }
    } catch(e) {
      state = previousState;
    }
  }

  Future<void> favorite() async {
    final previousState = state;
    state = !state; 

    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return;

      if (state) {
        await _supabase.from('user_favorites').insert({
          'user_id': userId,
          'restaurant_id': restaurantId,
        });
      } else {
        await _supabase.from('user_favorites').delete().match({
          'user_id': userId,
          'restaurant_id': restaurantId,
        });
      }
    } catch (e) {
      state = previousState;
    }
  }
}

final favoriteRestaurantProvider = StateNotifierProvider.family.autoDispose<FavoriteRestaurantNotifier, bool, String>((ref, restaurantId) {
  return FavoriteRestaurantNotifier(restaurantId); 
});