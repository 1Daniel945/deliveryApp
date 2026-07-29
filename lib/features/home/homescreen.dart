import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categoryList = ['Pizzas', 'Hamburgesas', 'Tacos', 'Botanas', 'Sushi', 'Farmacias'];
  String selectedCategory = 'Promotions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Entrega en',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
                fontWeight: .bold,
              ),
            ),
            const Row(
              children: [
                Text(
                  'Mi Direccion Actual #123',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: .bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.deepOrange,)
              ],
            ),
          ],
        ),  
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black,),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: '¿Qué se te antoja hoy?',
                    prefixIcon: Icon(Icons.search, color: Colors.grey,),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12)
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .bold
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: categoryList.map((category) {
                    final isSelected = selectedCategory == category;
                    return CategoryItem(
                      url: 'https://picsum.photos/200/300',
                      title: category,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          if(selectedCategory == category) {
                            selectedCategory = 'Promociones';
                          }
                          else {
                            selectedCategory = category;
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
                    '$selectedCategory:',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ), 
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 180,
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
                                  'https://i.ibb.co/8nbLHwwT/burger-King.jpg',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Burger King',
                                style: TextStyle(
                                  fontWeight: .bold
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
                                  'https://i.ibb.co/hRKXQ6Zp/dominos.jpg',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Dominos Pizza',
                                style: TextStyle(
                                  fontWeight: .bold
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
                                  'https://i.ibb.co/81pYmF8/Kfc.jpg',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'KFC',
                                style: TextStyle(
                                  fontWeight: .bold
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
                                  'https://i.ibb.co/TDpnY9vf/Litte-Caesars.jpg',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Little Caesars',
                                style: TextStyle(
                                  fontWeight: .bold
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
                                  'https://i.ibb.co/B5xCdF0C/Star-Bucks.jpg',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Starbucks',
                                style: TextStyle(
                                  fontWeight: .bold
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
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  
  final String url, title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.url,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          splashColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.deepOrange : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    url,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 6,),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? .bold : .normal,
                  color: isSelected ? Colors.deepOrange : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ), 
    );
  }
}