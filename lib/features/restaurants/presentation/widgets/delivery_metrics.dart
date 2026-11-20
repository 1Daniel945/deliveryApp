import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class DeliveryMetrics extends StatelessWidget {
  const DeliveryMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.textSecondary,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: List.of([AppColors.surface, AppColors.border]),
            ),
          ),
          child: Row(
            spacing: 16,
            mainAxisSize: .min,
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
                  Text('\$18 MXN'),
                ],
              ),
              const SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: Colors.white54,
                  thickness: 1,
                  width: 20,
                ),
              ),
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
            ],
          ),
        ),
        Divider(indent: 10, endIndent: 10),
      ],
    );
  }
}
