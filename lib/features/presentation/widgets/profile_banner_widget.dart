import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      alignment: .bottomCenter,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.amber,
        shape: .rectangle,
        gradient: LinearGradient(
          colors: List.of([
            AppColors.surface,
            AppColors.border,
          ]),
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.border
        ),
      ),
      child: Row(
        mainAxisAlignment: .center,
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: Image.network('https://i.ibb.co/LzcFfGCH/1779166947552.jpg').image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Text(
                'Hola,',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: .bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'Juan Daniel Jimenez Lopez',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: .bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}