import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/restaurants/presentation/providers/favorite_restaurant_notifier.dart';
import 'package:flutter_application_1/features/restaurants/presentation/providers/restaurant_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

/*class RestaurantCard extends ConsumerStatefulWidget {
  
  const RestaurantCard({
    super.key,
    required this.id,
    required this.name,
    required this.bannerUrl,
    required this.logoUrl,
    required this.isPM,
    required this.closingHour,
    required this.closingMinutes,
    required this.openHour,
    required this.openMinutes,
  });
  
  final String id;
  final String name;
  final String bannerUrl;
  final String logoUrl;
  final bool isPM;
  final int closingHour;
  final int closingMinutes;
  final int openHour;
  final int openMinutes;

  @override
  ConsumerState<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends ConsumerState<RestaurantCard> {
  
  bool isLoading = true;
  List<RestaurantCategoriesModel> restaurants = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final data = RestaurantcategoriesDatasource(supabase);
      final  x = RestaurantFavorites();
      final r = await x.isFavorite(widget.id);
      
      final result = await data.getCategories(widget.id);
      setState(() {
        restaurants = result;
        isLoading = false;
      });
    } catch(e) {
      setState(() {
        isLoading = false;
      });
      throw Exception('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(favoriteRestaurantProvider(widget.id));
    final now = DateTime.now();
    final currentMinutes = (now.hour * 60) + now.minute;
    final openMinutes = (widget.openHour * 60) + widget.openMinutes;
    final closeMinutes = (widget.closingHour * 60) + widget.closingMinutes;
    bool isOpen = currentMinutes >= closeMinutes && currentMinutes < openMinutes;
    return SafeArea(
      child: Center(
        child: Container(
          height: 220,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: 1.0),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.black,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  widget.bannerUrl,
                  height: 100,
                  width: double.infinity,
                  fit: .cover,
                  cacheHeight: 800,
                  filterQuality: .high,
                ),
              ),
              Positioned(
                top: 3,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.surface,
                        AppColors.border,
                        AppColors.textSecondary,
                      ],
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      print('Id del restaurante: ${widget.id}');
                      ref.read(favoriteRestaurantProvider(widget.id).notifier).favorite();
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite_outlined : Icons.favorite_outline, 
                      color: isFavorite ? Colors.red :Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.logoUrl,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -2,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: .bold
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: isOpen ? AppColors.success : Colors.red,
                            shadows: [
                              Shadow(color: AppColors.success),
                              Shadow(color: Colors.green),
                              Shadow(color: Colors.greenAccent),
                            ],
                          ),
                          const SizedBox(width: 4,),
                          isOpen ?
                          Text(
                            'Abierto ahora | Cierra a las ${widget.openHour % 12 == 0 ? 12 : widget.openHour % 12}:${widget.openMinutes == 0 ? '00' : widget.openMinutes} ${widget.isPM ? 'P.M.' : 'A.M.'}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .bold,
                            ),
                          )
                          :
                          Text(
                            'Cerrado | Abre a las ${widget.closingHour % 12 == 0 ? 12 : widget.closingHour % 12}:${widget.closingMinutes == 0 ? '00' : widget.closingMinutes} ${!widget.isPM ? 'P.M.' : 'A.M.'}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      SizedBox(
                        height: 40,
                        child: (restaurants.isNotEmpty && restaurants.last.categories.isNotEmpty) ?
                          ListView.builder(
                            scrollDirection: .horizontal,
                            itemCount: restaurants.last.categories.length,
                            itemBuilder: (context, index) {
                              final restaurant = restaurants.last.categories;    
                              return Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: .circular(12),
                                  color: Color(0xFF2A2A2C),
                                ),
                                child: Text(
                                  restaurant[index],
                                  style: TextStyle(
                                    color: Color(0xFFE1E1E6),
                                    fontWeight: .bold,
                                  ),
                                ),
                              ); 
                            },
                          )
                          : 
                        const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ), 
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
*/

class RestaurantCard extends ConsumerWidget {
  const RestaurantCard({
    super.key,
    required this.id,
    required this.name,
    required this.bannerUrl,
    required this.logoUrl,
    required this.isPM,
    required this.closingHour,
    required this.closeMinutes,
    required this.openHour,
    required this.openMinutes,
  });

  final String id;
  final String name;
  final String bannerUrl;
  final String logoUrl;
  final bool isPM;
  final int closingHour;
  final int closeMinutes;
  final int openHour;
  final int openMinutes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isFavorite = ref.watch(favoriteRestaurantProvider(id));
    final categoriesAsync = ref.watch(restaurantCategoriesProvider(id));
    final isLoading = categoriesAsync.isLoading;
    final categories = categoriesAsync.asData?.value ??[];
    final now = DateTime.now();
    final currentMinutes = (now.hour * 60) + now.minute;
    final openMinutess = (openHour * 60) + openMinutes;
    final closeMinutess = (closingHour * 60) + closeMinutes;
    bool isOpen = currentMinutes >= closeMinutess && currentMinutes < openMinutess;
    
    return SafeArea(
      child: Center(
        child: Container(
          height: 220,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: 1.0),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const[
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.black,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  bannerUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  cacheHeight: 800,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Positioned(
                top: 3,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.surface,
                        AppColors.border,
                        AppColors.textSecondary,
                      ],
                    ),
                  ),
                  child: IconButton(
                    onPressed: (){
                      ref.read(favoriteRestaurantProvider(id).notifier).favorite();
                    }, 
                    icon: Icon(
                      isFavorite ? Icons.favorite_outlined : Icons.favorite_outline,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(logoUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -2,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: .bold
                        ),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: isOpen ? AppColors.success : Colors.red,
                            shadows: [
                              Shadow(color: AppColors.success),
                              Shadow(color: Colors.green),
                              Shadow(color: Colors.greenAccent),
                            ],
                          ),
                          const SizedBox(width: 4,),
                          isOpen ?
                          Text(
                            'Abierto ahora | Cierra a las ${openHour % 12 == 0 ? 12 : openHour % 12}:${openMinutes == 0 ? '00' : openMinutes} ${isPM ? 'P.M.' : 'A.M.'}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .bold,
                            ),
                          )
                          :
                          Text(
                            'Cerrado | Abre a las ${closingHour % 12 == 0 ? 12 : closingHour % 12}:${closeMinutes == 0 ? '00' : closeMinutes} ${!isPM ? 'P.M.' : 'A.M.'}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Skeletonizer(
                        enabled: isLoading,
                        child: SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: isLoading ? 3 : categories.last.categories.length,
                            itemBuilder: (context, index) {
                              final textToShow = isLoading ? 'Cargando...' : categories.last.categories[index];
                              return Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF24242C),
                                ),
                                child: Text(
                                  textToShow,
                                  style: const TextStyle(
                                    color: Color(0xFFE1E1E6),
                                    fontWeight: .bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ), 
                      ),
                    ],
                  ),
                ), 
              ), 
            ],
          ),
        ),
      ) 
    );

  }


}