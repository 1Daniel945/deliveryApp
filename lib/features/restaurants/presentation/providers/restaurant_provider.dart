import 'package:flutter_application_1/features/restaurants/data/datasources/restaurant_datasource.dart';
import 'package:flutter_application_1/features/restaurants/data/models/restaurant_model.dart';
import 'package:flutter_application_1/features/restaurants/data/respositories/restaurant_repository.dart';
import 'package:flutter_application_1/features/restaurants/domain/repositories/restaurant_repository.dart';
import 'package:flutter_application_1/features/restaurants/domain/usecases/get_especific_restaurant.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final SpecificRestaurantDataSourceProvider = Provider<RestaurantDatasource>((ref) {
  return RestaurantDatasource(supabase);
}); 

final SpecificRestaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImp(
    ref.read(SpecificRestaurantDataSourceProvider),
  );
});

final SpecificRestaurantProvider = FutureProvider.autoDispose.family<RestaurantModel?, String>((ref, restaurantId) async {
  final useCase = GetSpecificRestaurant(ref.read(SpecificRestaurantRepositoryProvider));
  return await useCase(restaurantId); 
});