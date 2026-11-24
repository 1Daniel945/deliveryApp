import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
import 'package:flutter_application_1/features/restaurants/data/models/extras_model.dart';
import 'package:flutter_application_1/features/restaurants/presentation/providers/products_provider.dart';
import 'package:flutter_application_1/features/restaurants/presentation/widgets/delivery_metrics.dart';
import 'package:flutter_application_1/features/restaurants/domain/entities/menu_categories_entity.dart';
import 'package:flutter_application_1/features/restaurants/presentation/providers/menu_provider.dart';
import 'package:flutter_application_1/features/restaurants/presentation/providers/restaurant_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RestaurantScreen extends ConsumerWidget {
  final String restaurantId;

  const RestaurantScreen({
    super.key, 
    required this.restaurantId
  });
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(menuCategoriesProvider(restaurantId));
    final menuAsync = ref.watch(restaurantMenuProvider(restaurantId));
    final products = menuAsync.value ?? [];
    final isLoading = categoriesAsync.isLoading;
    final categories = categoriesAsync.value ?? List.generate(
      3, (index) => MenuCategoriesEntity(id: '$index', categoryName: 'Categorias cargando...'),
    );
    final currentRestaurant = ref.watch(SpecificRestaurantProvider(restaurantId));
    final restaurnatName = currentRestaurant.value?.name ?? '';
    final List<MenuCategoriesEntity> categoriesList = categories.toList();
    /*final Map<String, List<ProductModel>>categoriesProductos = {};
    for(final product in products) {
      categoriesProductos.putIfAbsent(product.categoryName, ()=>[]).add(product);
    }
    categoriesProductos.entries.forEach((MapEntry<String, List<ProductModel>> entry) {
      final String categoryName = entry.key;
      final List<ProductModel> items = entry.value;
      debugPrint('$categoryName:');
      for(final name in items) {
        debugPrint(name.productName);
      }
    });*/
    final mp = ref.watch(categoriesProductsProvider(restaurantId));
    return Scaffold(
      body: SafeArea(
        child: Skeletonizer(
          enabled: isLoading,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  scrollDirection: .vertical,
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 220,
                      floating: true,
                      pinned: true,
                      backgroundColor: const Color(0xFF0F1117),
                      elevation: 0,
                      surfaceTintColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        title: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text(
                            'Menú de $restaurnatName',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                        titlePadding: const EdgeInsetsDirectional.only(
                          start: 16,
                          bottom: 18,
                        ),
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              currentRestaurant.value?.urlBanner ?? '', 
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFF1E2329),
                                );
                              },
                            ),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.35, 0.65, 1.0],
                                  colors: [
                                    Colors.transparent,
                                    Color(0x990F1117),
                                    Color(0xFF0F1117),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: .spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(currentRestaurant.value?.urlLogo ?? 'https://i.ibb.co/7tdcDV0W/skeleton.webp',),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                spacing: 5,
                                children: [
                                  Text(
                                    currentRestaurant.value?.name ?? '',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Icon(Icons.location_on, color: AppColors.primary,),
                                      Expanded(
                                        child: Text(
                                          'Av. Puebla 30, El Progreso, 38820 Moroleón, Gto.',
                                          maxLines: 1,
                                          overflow: .ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              highlightColor: const Color(0xFFFFE082),
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                                iconColor: WidgetStatePropertyAll(Colors.black,),
                                shape: WidgetStatePropertyAll(ContinuousRectangleBorder(borderRadius: .circular(12))),
                                padding: WidgetStatePropertyAll(.all(10)),
                              ),
                              onPressed: () {

                              },
                              icon: Row(
                                spacing: 4,
                                mainAxisAlignment: .center,
                                children: [
                                  Icon(Icons.map),
                                  Text(
                                    'Ver mapa',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: .bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children:[
                          DeliveryMetrics(),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _CategoryHeaderDelegate(categories: categoriesList)
                    ),
                    products.isEmpty ? SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Aún no hay productos', 
                          style: TextStyle(
                            fontSize: 18, 
                            fontWeight: .bold,
                          ),
                        ),
                      ),
                    ) : 
                    SliverList.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final items = mp[categories[index].categoryName] ?? [];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                categories[index].categoryName,
                                style: TextStyle(
                                  fontWeight: .bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 16,),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.57,
                                ),
                                itemCount: items.length,
                                itemBuilder: (context, indexP) => Container(
                                /*margin: index & 1 == 0
                                    ? EdgeInsets.fromLTRB(10, 5, 5, 5)
                                    : EdgeInsets.fromLTRB(5, 5, 10, 5),*/
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF1E2329),
                                      Color(0xFF15191F),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: .circular(20),
                                  border: Border.all(
                                    color: const Color(0xFF3A3F46),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 12,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ), 
                                child: Product(
                                    productName: items[indexP].productName, 
                                    productDescription: items[indexP].productDescription, 
                                    urlImage: items[indexP].urlImage, 
                                    productPrice: items[indexP].productPrice, 
                                    ingredients: items[indexP].ingredients, 
                                    extras: items[indexP].extras, 
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                    /*SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        childAspectRatio: 0.66,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            margin: index & 1 == 0
                                ? EdgeInsets.fromLTRB(10, 5, 5, 5)
                                : EdgeInsets.fromLTRB(5, 5, 10, 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF1E2329),
                                  Color(0xFF15191F),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: .circular(20),
                              border: Border.all(
                                color: const Color(0xFF3A3F46),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 12,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Product(
                              productName: products[index].productName,
                              productDescription: products[index].productDescription,
                              urlImage: products[index].urlImage,
                              productPrice: products[index].productPrice,
                              ingredients: products[index].ingredients,
                              extras: products[index].extras,
                            ),
                          );
                        },
                        childCount: products.length,
                      ),
                    ),
                  */
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {

  final String productName;
  final String productDescription;
  final String urlImage;
  final int productPrice;
  final List<String> ingredients;
  final List<ExtrasModel>extras;

  const Product({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.urlImage,
    required this.productPrice,
    required this.ingredients,
    required this.extras,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        Stack(
          clipBehavior: .none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(
                  urlImage,
                  errorBuilder:
                      (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[900],
                          alignment: .center,
                          child: Column(
                            mainAxisSize: .min,
                            children: const [
                              Icon(
                                Icons.wifi_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Sin imagen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 2,
              bottom: -10,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 0.85,
                          minChildSize: 0.3,
                          maxChildSize: 0.95,
                          expand: false,
                          builder: (context, scrollController) {
                            final bottomInset = MediaQuery.of(context).viewInsets.bottom;
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: bottomInset),
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: .min,
                                    crossAxisAlignment: .start,
                                    spacing: 8,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 40,
                                          height: 4,
                                          margin: const EdgeInsets.only(bottom: 8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[600],
                                            borderRadius: .circular(2),
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: .circular(12),
                                        child: AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Image.network(
                                            urlImage,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                color: Colors.grey[900],
                                                alignment: .center,
                                                child: Column(
                                                  mainAxisSize: .min,
                                                  children: const [
                                                    Icon(
                                                      Icons.wifi_off,
                                                      color: Colors.grey,
                                                      size: 40,
                                                    ),
                                                    SizedBox(height: 4,),
                                                    Text(
                                                      'Sin imagen',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            fit: .cover,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: .spaceBetween,
                                        children: [
                                          Text(
                                            productName,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: .bold,
                                            ),
                                          ),
                                          Text(
                                            '\$$productPrice MXN',
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: .bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        productDescription,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: .normal,
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      const Divider(endIndent: 5, indent: 5,),
                                      Column(
                                        crossAxisAlignment: .start,
                                        children: [
                                          const Text(
                                            'Ingredientes',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: .bold,
                                            ),
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: ingredients.length,
                                            itemBuilder: (context, index) {
                                              return CheckboxListTile(
                                                title: Text(
                                                  ingredients[index],
                                                  style: const TextStyle(color: Colors.white),
                                                ),
                                                checkColor: Colors.black,
                                                fillColor: WidgetStateProperty.all(Colors.amberAccent),
                                                checkboxShape: CircleBorder(),
                                                value: false,
                                                onChanged: null,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        'Extras',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: .bold,
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: extras.length,
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                            title: Text(extras[index].extraName, style: TextStyle(color: Colors.white),),
                                            checkColor: Colors.black,
                                            fillColor: WidgetStateProperty.all(Colors.amberAccent),
                                            checkboxShape: CircleBorder(),
                                            value: true,
                                            onChanged: null,
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10,),
                                      TextField(
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          hintText: 'Instrucciones especiales',
                                          hintStyle: TextStyle(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      const Divider(endIndent: 5, indent: 5,),
                                      Row(
                                        mainAxisAlignment: .spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(50),
                                              border: Border.all(color: Colors.white),
                                            ),
                                            child: Row(
                                              spacing: 10,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                              
                                                  }, 
                                                  icon: Icon(
                                                    Icons.remove,
                                                  ),
                                                ),
                                                Text(
                                                  '0',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: .bold,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: (){
                                                    
                                                  }, 
                                                  icon: Icon(
                                                    Icons.add,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: .circular(50),
                                              color: AppColors.primary,
                                            ),
                                            child: ButtonWidget1(
                                              title: 'Agregar al carrito \$15', 
                                              icon: Icon(Icons.add_location), 
                                              color: AppColors.primary, 
                                              colorIcon: Colors.black, 
                                              onTap: () {

                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        );
                      },
                    );
                  },
                  iconSize: 18,
                  icon: Icon(Icons.add, fontWeight: .bold,),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
        Text(
          productName,
          style: TextStyle(
            fontWeight: .bold,
            color: Colors.white,
          ),
          maxLines: 1,
          overflow: .ellipsis,
        ),
        const SizedBox(height: 6,),
        Text(
          productDescription,
          overflow: .ellipsis,
          maxLines: 2,
          style: TextStyle(
            fontWeight: .normal,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 4,),
        Text(
          '\$$productPrice MXN',
          style: TextStyle(
            fontWeight: .bold,
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class _CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<MenuCategoriesEntity> categories;

  _CategoryHeaderDelegate({required this.categories});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: /*TextButton(
            onPressed: (){}, 
            child: Text(
              categories[index].categoryName,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textThird,
              ),
            ),
          ),*/
          GestureDetector(
            onTap: () {
              //Actualizar donde se coloca el scroll del boton de una categoria 
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFF1E2329),
                border: Border.all(color: AppColors.border),
                borderRadius: .circular(12),
              ), 
              child: Row(
                mainAxisSize: .min,
                children: [
                  Text(
                    categories[index].categoryName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant _CategoryHeaderDelegate oldDelegate) => false;
}
