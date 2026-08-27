import 'package:flutter/material.dart';

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
    ('Sushi','https://i.ibb.co/fd8gHprD/Sushi-Cartoon.png'), 
    ('Farmacias', 'https://i.ibb.co/67GyxT0V/farmacia-Cartoon.jpg')
  ];
  String selectedCategory = 'Promociones';
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 44, 52),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 223, 0),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Entrega en',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
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
                    fontWeight: .normal,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black,)
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black,),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Stack( 
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
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.search, 
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12)
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
                const SizedBox(height: 10,),
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
                              if(selectedCategory == category.$1) {
                                selectedCategory = 'Promociones';
                              }
                              else {
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
                      const SizedBox(height: 20,),
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
                              CustomCard(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
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
                              if(isLandScape) const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          SizedBox(
                            child: SingleChildScrollView(
                              scrollDirection: .horizontal,
                              child: Row(
                                spacing: 5,
                                children: [
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  indent: 10,
                  endIndent: 10,
                ),
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
                              if(isLandScape) const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          SizedBox(
                            child: SingleChildScrollView(
                              scrollDirection: .horizontal,
                              child: Row(
                                spacing: 5,
                                children: [
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
                                  CustomCard(),
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
          if(MediaQuery.of(context).viewInsets.bottom == 0) 
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: selectedIndex,
                  backgroundColor: Color.fromARGB(255, 255, 223, 0),
                  elevation: 0,
                  selectedItemColor: Color.fromARGB(255, 218, 165, 32),
                  unselectedItemColor: Colors.black,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  items: [      
                    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '', activeIcon: Icon(Icons.home_filled)),
                    BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: '', activeIcon: Icon(Icons.favorite_outlined)),
                    BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: '', activeIcon: Icon(Icons.person)),
                  ],
                ),
              ),
            ), 
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {

  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 30, 34, 45),
      ),
      child: Column(
        spacing: 2,
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
          Column(
            spacing: 4,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'StarbucksStarbucksStarbucks',
                      style: TextStyle(
                        fontWeight: .bold,
                        backgroundColor: Colors.red,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '%45 OFF',
                    style: TextStyle(
                      fontWeight: .bold,
                      backgroundColor: Colors.lightGreen,
                      shadows: [Shadow(
                        blurRadius: BorderSide.strokeAlignCenter,
                        color: Colors.amber,
                        offset: Offset.infinite,
                      )]
                    ),
                  ),
                  Text(
                    '\$255',
                    style: TextStyle(
                      decoration: .lineThrough,
                      color: Colors.grey,
                    ),
                  ),  
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        '\$225',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: .bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),  
            ],
          ),
        ],
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
                  color: isSelected ? Color.fromARGB(255, 255, 223, 0) : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? Color.fromARGB(255, 218, 165, 32) : Colors.transparent,
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
                  fontSize: 16,
                  fontWeight: isSelected ? .bold : .normal,
                  color: isSelected ? Color.fromARGB(255, 255, 223, 0) : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ), 
    );
  }
}