import 'package:flutter_application_1/features/home/data/models/category_model.dart';
import 'package:flutter_application_1/features/home/domain/entities/categories.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepository {
  
  final supabase = Supabase.instance.client;

  Future<List<CategoriesEntity>> getCategories() async {
    final data = await supabase.from('categories').select();
    //print('data are: $data');
    final categories = (data as List)
      .map((json) => CategoryModel.fromJson(json))
      .toList();
    return categories;
  }

  Stream<List<CategoriesEntity>> getCategoriesStream() {
    return supabase
      .from('categories')
      .stream(primaryKey: ['id'])
      .map((data) => data.map((json) => CategoryModel.fromJson(json)).toList());
  }

}