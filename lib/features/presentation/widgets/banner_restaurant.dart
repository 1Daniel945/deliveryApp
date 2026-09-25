import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/home/favorites_screen.dart';
import 'package:flutter_application_1/features/presentation/widgets/restaurant_card.dart';

class BannerRestaurant extends StatelessWidget {
  const BannerRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RestaurantCard(
          name: 'DiTotinos Restaurant', 
          bannerUrl: 'https://i.ibb.co/5t6kCHz/pizzas-hechas-en-horno-1.jpg', 
          logoUrl: 'https://i.ibb.co/hFPH3b6P/Logo-Ditotinos.png',
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.textSecondary,
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: List.of([AppColors.surface, AppColors.border]),
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
                      Text('Envío', style: TextStyle(fontWeight: .bold)),
                      Icon(Icons.motorcycle_outlined),
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
                      Text('Entrega', style: TextStyle(fontWeight: .bold)),
                      Icon(Icons.watch_later_outlined),
                    ],
                  ),
                  Text('25 min'),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Row(
                    spacing: 2,
                    children: [
                      Text('Calificación', style: TextStyle(fontWeight: .bold)),
                      Icon(Icons.star_outline_outlined),
                    ],
                  ),
                  Text('4.0 (50)'),
                ],
              ),
            ],
          ),
        ),
        Divider(
          indent: 10, 
          endIndent: 10,
        ),      
      ],
    );
  }
}
