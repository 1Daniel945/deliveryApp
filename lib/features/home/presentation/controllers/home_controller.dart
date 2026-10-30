import 'package:flutter_application_1/features/home/data/repository/home_repository.dart';
import 'package:flutter_application_1/features/home/domain/entities/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider((ref) => HomeRepository());

final categoriesStreamProvider = StreamProvider<List<CategoriesEntity>>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return repository.getCategoriesStream();
});