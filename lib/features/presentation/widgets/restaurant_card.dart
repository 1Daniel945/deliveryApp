import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.name,
    required this.bannerUrl,
    required this.logoUrl,
  });
  
  final String name;
  final String bannerUrl;
  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          height: 160,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide()),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '$bannerUrl ',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline, 
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 10,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        '$logoUrl ',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 90,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      '$name ',
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: .bold
                      ),
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 12,
                          color: AppColors.success,
                          shadows: [
                            Shadow(color: AppColors.success),
                            Shadow(color: Colors.green),
                            Shadow(color: Colors.greenAccent),
                          ],
                          blendMode: BlendMode.screen,
                        ),
                        Text('Abierto ahora | cierra a las 10:00 P.M.'),
                      ],
                    ),
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
