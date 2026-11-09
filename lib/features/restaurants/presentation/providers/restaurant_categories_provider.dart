import 'package:flutter_application_1/features/restaurants/data/datasources/restaurant_categories_datasource.dart';
import 'package:flutter_application_1/features/restaurants/data/respositories/restaurant_catagories_repository.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/restaurant_categories_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/restaurant_categories_repository.dart';
import 'package:flutter_application_1/features/restaurants/domain/usecases/get_restaurant_categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final restaurantCategoriesDataSourceProvider = Provider<RestaurantcategoriesDatasource>((ref) {
  return RestaurantcategoriesDatasource(Supabase.instance.client);
}); 

final restaurantCategoriesRepositoryProvider = Provider<RestaurantCategoriesRepository>((ref) {
  return RestaurantcatagoriesRepositoryImp(
    ref.read(restaurantCategoriesDataSourceProvider),
  );
});

final restaurantCategoriesProvider = FutureProvider.autoDispose.family<List<RestaurantcategoriesEntity>, String>((ref, restaurantId) async {
  final useCase = GetRestaurantCategories(ref.read(restaurantCategoriesRepositoryProvider));
  return await useCase(restaurantId); // O useCase.execute(restaurantId) dependiendo de cómo lo nombraste
});