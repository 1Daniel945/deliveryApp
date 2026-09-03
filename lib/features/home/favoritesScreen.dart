import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.go('/');
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 40, 44, 52),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 223, 0),
          title: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go('/');
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Mis favoritos',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CustomCard(
                  title: 'Nachos',
                  onTap: () {
                    context.push('/');
                  },
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title; 
  final VoidCallback onTap;
  
  const CustomCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child:  Container(
        padding: EdgeInsets.all(10),
        width: .maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 30, 34, 45),
        ),
        child: Row(
          spacing: 10,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://i.ibb.co/fdQvkrCb/nachos.jpg',
                    width: 100,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
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
                          shadows: [
                            Shadow(
                              blurRadius: BorderSide.strokeAlignCenter,
                              color: Colors.amber,
                              offset: Offset.infinite,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$255',
                        style: TextStyle(
                          decoration: .lineThrough,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
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
            ),
          ],
        ),
      ),
    );
  }
}
