import 'package:flutter_application_1/features/restaurants/data/datasources/menu_categories_datasource.dart';
import 'package:flutter_application_1/features/restaurants/data/respositories/menu_categories_repository.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/menu_categories_entity.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/menu_categories_repository.dart';
import 'package:flutter_application_1/features/restaurants/domain/usecases/get_menu_categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final menuCategoriesDataSourceProvider = Provider<MenuCategoriesDatasource>((ref) {
  return MenuCategoriesDatasource(Supabase.instance.client);
}); 

final menuCategoriesRepositoryProvider = Provider<MenuCategoriesRepository>((ref) {
  return MenuCategoriesRepositoryImp(
    ref.read(menuCategoriesDataSourceProvider),
  );
});

final menuCategoriesProvider = FutureProvider.autoDispose.family<List<MenuCategoriesEntity>, String>((ref, restaurantId) async {
  final useCase = GetMenuCategories(ref.read(menuCategoriesRepositoryProvider));
  return await useCase(restaurantId); // O useCase.execute(restaurantId) dependiendo de cómo lo nombraste
});