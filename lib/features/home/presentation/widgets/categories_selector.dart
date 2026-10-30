import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/domain/entities/categories.dart';
import 'package:flutter_application_1/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_application_1/features/presentation/widgets/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
  
class Categories extends ConsumerStatefulWidget {

  const Categories({super.key,});

  @override
  ConsumerState<Categories> createState() => _Categories();
}

class _Categories extends ConsumerState<Categories> {

  List<CategoriesEntity> categories = [];

  @override
  void initState() {
    super.initState();
  }
  
  String selectedCategory = 'Promociones';
  
  @override
  Widget build(BuildContext context) {
    final categoriesList = ref.watch(categoriesStreamProvider); 
    return Skeletonizer(
      enabled: categoriesList.isLoading,
      child: SizedBox(
        height: 110,
        child: categoriesList.when(
          data: (categories) {
            return ListView.builder(
              scrollDirection: .horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedCategory == categories[index].name;
                return CategoryItem(
                  url: categories[index].imageurl,
                  title: categories[index].name,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      if (selectedCategory == categories[index].name) {
                        selectedCategory = 'Promociones';
                      } else {
                        selectedCategory = categories[index].name;
                      }
                    });
                  },
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator(),),
          error: (e, stackTrace) => Center(child: Text('Error $e'),),
        ),
      ),
    );
  }
}
