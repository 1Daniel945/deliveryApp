import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.textPrimary,
              ),
              highlightColor: AppColors.textSecondary,
            ),
            Text(
              'Menú',
              style: TextStyle(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              Stack(
                clipBehavior: .none,
                alignment: .center,
                children: [
                  ClipRRect(
                    borderRadius: .circular(12),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: AppColors.border),
                        image: DecorationImage(
                          image: NetworkImage('https://i.ibb.co/6csBfWhG/mariscos.webp'),
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border),
                        image: DecorationImage(
                          image: NetworkImage('https://i.ibb.co/N6ZpPndw/logo-cangrejo-dibujado-mano-23-2149228426.avif'),
                          fit: BoxFit.contain, 
                        ),
                      ),
                    ),  
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: .start, 
                  children: [
                    Text(
                      'Mariscos Crawfish',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      'Mariscos frescos, auténticos y llenos de sabor directo a tu mesa.¡Disfruta lo mejor del mar en cada bocado!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: .normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.textSecondary,
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: List.of([
                      AppColors.surface,
                      AppColors.border,
                    ]),
                  ),
                  border: Border.all(
                    color: AppColors.primary,
                  ),
                ),
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: .center,
                  children: [
                    Column(
                      children: [
                        Row(
                          spacing: 2,
                          children: [
                            Text(
                              'Envío',
                              style: TextStyle(
                                fontWeight: .bold,
                              ),
                            ),
                            Icon(
                              Icons.motorcycle_outlined,
                            ),
                          ],
                        ),
                        Text('\$18 MXM'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Row(
                          spacing: 2,
                          children: [
                            Text(
                              'Entrega',
                              style: TextStyle(
                                fontWeight: .bold,
                              ),
                            ),
                            Icon(
                              Icons.watch_later_outlined,
                              
                            ),
                          ],
                        ),
                        Text('\$25 min'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Row(
                          spacing: 2,
                          children: [
                            Text(
                              'Calificación',
                              style: TextStyle(
                                fontWeight: .bold,
                              ),
                            ),
                            Icon(
                              Icons.star_outline_outlined,
                            ),
                          ],
                        ),
                        Text(
                          '4.0 (50)',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}