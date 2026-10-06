import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class DirectionsAdding extends StatelessWidget {
  const DirectionsAdding({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Container(
      width: .maxFinite,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
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
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.primary,),
              iconColor: WidgetStatePropertyAll(Colors.black,),
              shape: WidgetStatePropertyAll(ContinuousRectangleBorder(borderRadius: .circular(12))),
              padding: WidgetStatePropertyAll(.all(15)),
            ),
            onPressed: (){
              //Redireccionar al mapa para que seleccione su ubicación
            }, 
            icon: Row(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.location_on,),
                Text(
                  'Agregar una nueva dirección',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: .bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}