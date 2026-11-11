import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_application_1/features/home/presentation/widgets/categories_selector.dart';
import 'package:flutter_application_1/features/restaurants/data/datasources/restaurant_datasource.dart';
import 'package:flutter_application_1/features/restaurants/data/models/restaurant_model.dart';
import 'package:flutter_application_1/features/restaurants/presentation/widgets/restaurant_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/features/presentation/widgets/custom_card.dart';
import 'package:flutter_application_1/features/presentation/widgets/select_directions.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  List<RestaurantModel> restaurants = [];
  bool isSkeleton = true;

  @override
  void initState() {
    super.initState();
    loadRestaurants();
  }

  Future<void> loadRestaurants() async {
    try {
      final data = RestaurantDatasource();
      final result = await data.getRestaurants();
      setState(() {
        restaurants = result;
        isSkeleton = false;
      });
    } catch(e) {
      isSkeleton = true;
      throw Exception('Error al obtener los restaurantes: $e');
    }
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    final currentCategory = ref.watch(selectCategoryProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        title: Container(
          margin: EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Entrega en',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textThird,
                  fontWeight: .bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Mi Direccion Actual #123',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textThird,
                      fontWeight: .normal,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        showDragHandle: true,
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              SelectDirection(),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textThird,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: .maxFinite,
                      alignment: .topStart,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: AppColors.border, width: 2),
                        borderRadius: .circular(30),
                      ),
                      child: TextButton.icon(
                        onPressed: (){}, 
                        label: Text(
                          'Busca restaurantes, platillos o categorias', 
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: .normal,  
                            overflow: .ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        icon: Icon(
                          Icons.search,
                          size: 24,
                          color: Colors.white,
                        ),)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      'Categorias',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Categories(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentCategory.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 223, 0),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              spacing: 10,
                              children: [
                                Column(
                                  spacing: 10,
                                  crossAxisAlignment: .start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://i.ibb.co/fdQvkrCb/nachos.jpg',
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Burger King',
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 10,
                                  crossAxisAlignment: .start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://i.ibb.co/fdQvkrCb/nachos.jpg',
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Dominos Pizza',
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 10,
                                  crossAxisAlignment: .start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://i.ibb.co/fdQvkrCb/nachos.jpg',
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'KFC',
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 10,
                                  crossAxisAlignment: .start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        'https://i.ibb.co/fdQvkrCb/nachos.jpg',
                                        width: 140,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Little Caesars',
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(indent: 10, endIndent: 10),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              spacing: 230,
                              children: [
                                Text(
                                  'Mas populares',
                                  style: TextStyle(
                                    fontWeight: .bold,
                                    color: Colors.white,
                                  ),
                                ),
                                if (isLandScape) const Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              child: SingleChildScrollView(
                                scrollDirection: .horizontal,
                                child: Row(
                                  spacing: 5,
                                  children: [
                                    CustomCard(title: 'DiTotinos'),
                                    CustomCard(title: 'Toño'),
                                    CustomCard(title: 'Arandas'),
                                    CustomCard(title: 'Quesabirrias'),
                                    CustomCard(title: 'Con sabor'),
                                    CustomCard(title: 'Came house'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(indent: 10, endIndent: 10),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Todos los restaurantes',
                                  style: TextStyle(
                                    fontWeight: .bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: .vertical,
                              child: Skeletonizer(
                                enabled: isSkeleton,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: restaurants.length,
                                  itemBuilder: (context, index) {
                                    final restaurant = restaurants[index];
                                    final closingHour = int.parse(restaurant.closingTime.substring(0, 2));
                                    final closingMinutes = int.parse(restaurant.closingTime.substring(3, 5));
                                    final openHour = int.parse(restaurant.openTime.substring(0, 2));
                                    final openMinutes = int.parse(restaurant.openTime.substring(3, 5));
                                    return GestureDetector(
                                      onTap: () {
                                        context.push('restaurantScreen');
                                      },
                                      child:  RestaurantCard(
                                        name: restaurant.name, 
                                        bannerUrl: restaurant.urlBanner, 
                                        logoUrl: restaurant.urlLogo, 
                                        id: restaurant.id,
                                        isPM: openHour >= 12 && openHour <= 23,
                                        closingHour: closingHour,
                                        closeMinutes: closingMinutes,
                                        openHour: openHour,
                                        openMinutes: openMinutes,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            /*SizedBox(
                              child: SingleChildScrollView(
                                scrollDirection: .vertical,
                                child: Column(
                                  spacing: 5,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context.push('restaurantScreen');
                                      },
                                      child: RestaurantCard(
                                        name: 'DiTotinos Restaurant', 
                                        bannerUrl: 'https://i.ibb.co/5t6kCHz/pizzas-hechas-en-horno-1.jpg', 
                                        logoUrl: 'https://i.ibb.co/hFPH3b6P/Logo-Ditotinos.png',
                                      ),
                                    ),
                                    RestaurantCard(
                                      name: 'Mariscos Crawfish', 
                                      bannerUrl: 'https://i.ibb.co/6csBfWhG/mariscos.webp', 
                                      logoUrl: 'https://i.ibb.co/N6ZpPndw/logo-cangrejo-dibujado-mano-23-2149228426.avif',
                                    ),
                                  ],
                                ),
                              ),
                            ),*/

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Activar la barra inferior solo cuando el teclado esta oculto
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10,),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(100),
                    ),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        currentIndex: selectedIndex,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        selectedItemColor: AppColors.primary,
                        unselectedItemColor: AppColors.textThird,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                          switch (index) {
                            case 0:
                              if (context.canPop()) {
                                context.pop();
                                context.push('/home');
                              }
                              break;
                            case 1:
                              context.push('/favorite');
                              break;
                            case 2:
                              context.push('/profile');
                          }
                        },
                        items: [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined),
                            label: 'Home',
                            activeIcon: Icon(Icons.home_filled),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart_outlined),
                            label: 'Cart',
                            activeIcon: Icon(Icons.shopping_cart),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.person_2_outlined),
                            label: '',
                            activeIcon: Icon(Icons.person),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
