import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class DirectionsAdding extends StatelessWidget {
  const DirectionsAdding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Container(
      width: .maxFinite,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 2,
        children: [
          Text(
            'Configure su direccion de entrega',
            style: TextStyle(
              fontWeight: .bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4,),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: "Agrega una dirección de entrega",
            ),
          ),
        ],
      ),
    );
  }
}

