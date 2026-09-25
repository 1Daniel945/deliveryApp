import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/banner_restaurant.dart';
import 'package:go_router/go_router.dart';

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
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.textThird,
              ),
            ),
            Text(
              'Menú',
              style: TextStyle(
                color: AppColors.textThird,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BannerRestaurant(),
      ),
    );
  }
}
