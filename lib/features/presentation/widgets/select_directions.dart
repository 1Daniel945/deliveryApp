import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
//import 'package:flutter_application_1/features/presentation/widgets/button_widget.dart';
import 'package:flutter_application_1/features/presentation/widgets/button_widget1.dart';
class SelectDirection extends StatelessWidget {
  const SelectDirection({super.key});

  @override
  Widget build(BuildContext context) {
    //final textController = TextEditingController();
    return Container(
      width: .maxFinite,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 4,
        children: [
          Text(
            'Mis Direcciónes',
            style: TextStyle(fontWeight: .bold, fontSize: 20),
          ),
          Text(
            'Seleccionar dirección existente',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          /*TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: "Agrega una dirección de entrega",
            ),
          ),*/
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: .circular(12),
            ),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.location_on, color: AppColors.primary),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .bold,
                          color: AppColors.primary,
                        ),
                      ), 
                      Text(
                        'Blvd, de las Américas #88, Col. Providencia, C.P. 44630',
                        maxLines: 1,
                        overflow: .ellipsis,
                      ),
                    ],
                  ),
                ),
                Radio(value: false),
              ],
            ),
          ),
          SizedBox(height: 4),
          ButtonWidget1(
            title: 'Agrega una nueva dirección', 
            icon: Icon(Icons.add_location_rounded), 
            color: AppColors.primary,
            colorIcon: Colors.black, 
            onTap: (){}
          ),
          SizedBox(height: 4),
          ButtonWidget1(
            title: 'Dirección actual', 
            icon: Icon(Icons.my_location_rounded), 
            color: AppColors.primary,
            colorIcon: Colors.black, 
            onTap: (){}
          ),
        ],
      ),
    );
  }
}
