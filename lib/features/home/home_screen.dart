import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/restaurant_card.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/features/presentation/widgets/custom_card.dart';
import 'package:flutter_application_1/features/presentation/widgets/categories.dart';
import 'package:flutter_application_1/features/presentation/widgets/directions_adding.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<(String, String)> categoryList = [
    ('Pizzas', 'https://i.ibb.co/nMn7WhTC/pizza-Cartoon.png'),
    ('Hamburgesas', 'https://i.ibb.co/pBq9pqtX/Hamburgesa-Cartoon.png'),
    ('Tacos', 'https://i.ibb.co/VW77KdNp/Tacos-Cartoon.png'),
    ('Botanas', 'https://i.ibb.co/9mV7cCQd/Botanas-Cartoon.png'),
    ('Sushi', 'https://i.ibb.co/fd8gHprD/Sushi-Cartoon.png'),
    ('Farmacias', 'https://i.ibb.co/67GyxT0V/farmacia-Cartoon.jpg'),
  ];
  String selectedCategory = 'Promociones';
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
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
                        context: context,
                        builder: (context) {
                          return DirectionsAdding();
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
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: '¿Qué se te antoja hoy?',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
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
                  SizedBox(
                    height: 110,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: categoryList.map((category) {
                          final isSelected = selectedCategory == category.$1;
                          return CategoryItem(
                            url: category.$2,
                            title: category.$1,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                if (selectedCategory == category.$1) {
                                  selectedCategory = 'Promociones';
                                } else {
                                  selectedCategory = category.$1;
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$selectedCategory ',
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
                            SizedBox(
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
                            ),
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
