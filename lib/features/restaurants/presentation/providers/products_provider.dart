import 'package:flutter_application_1/features/restaurants/data/datasources/products_datasource.dart';
import 'package:flutter_application_1/features/restaurants/data/models/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final productsDatasourceProvider = Provider<ProductsDatasource>((ref) {
  final supabase = ref.read(supabaseClientProvider);
  return ProductsDatasource(supabase);
});

final restaurantMenuProvider = FutureProvider.family<List<ProductModel>, String>((ref, restaurantId) async {
  final dataSource = ref.read(productsDatasourceProvider);
  final rawData = await dataSource.getRestaurantMenu(restaurantId);
  final List<ProductModel> products = rawData.map((mp) {
    return ProductModel.fromJson(mp);
  }).toList();
  return products;
});

final categoriesProductsProvider = Provider.family<Map<String, List<ProductModel>>, String>((ref, restaurantId) {
  final menuAsync = ref.watch(restaurantMenuProvider(restaurantId));
  final products = menuAsync.value ?? [];
  final Map<String, List<ProductModel>> grouped = {};
  for(final product in products) {
    grouped.putIfAbsent(product.categoryName, ()=> <ProductModel>[]).add(product);
  }
  return grouped;
});