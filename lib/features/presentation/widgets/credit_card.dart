import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: .maxFinite,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.surface),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.surface,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 30,
            child: Text(
              'Card',
              style: TextStyle(
                fontWeight: .bold,
              ),
            ), 
          ),
          Positioned(
            top: 50,
            left: 30,
            child: Image.network(
              'https://i.ibb.co/Xf1mPfw7/chip.png',
              scale: 10,
            ),
          ),
          Positioned(
            top: 110,
            left: 30,
            child: Row(
              spacing: 20,
              children: [
                Text(
                  'XXXX',
                  style: TextStyle(
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  'XXXX',
                  style: TextStyle(
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  'XXXX',
                  style: TextStyle(
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  'XXXX',
                  style: TextStyle(
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 30,
            child: Text(
              'Bank',
              style: TextStyle(
                fontWeight: .bold,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Text(
              'XX/XX',
              style: TextStyle(
                fontWeight: .bold,
              ),
            ), 
          ),
          Positioned(
            bottom: 20,
            left: 30,
            child: Text(
              'Nombre del beneficiario',
              style: TextStyle(
                fontWeight: .bold,
              ),
            ), 
          ),
        ],
      ),
    );
  }
}