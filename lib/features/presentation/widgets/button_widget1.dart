import 'package:flutter/material.dart';

class ButtonWidget1 extends StatelessWidget {

  final VoidCallback ? onTap;
  final String title;
  final Icon icon;
  final Color color;
  final Color colorIcon;

  const ButtonWidget1({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.colorIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {    
    return IconButton(
      highlightColor: const Color(0xFFFFE082),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(color,),
        iconColor: WidgetStatePropertyAll(colorIcon,),
        shape: WidgetStatePropertyAll(ContinuousRectangleBorder(borderRadius: .circular(12))),
        padding: WidgetStatePropertyAll(.all(15)),
      ),
      onPressed: (){
        //Redireccionar al mapa para que seleccione su ubicación
      }, 
      icon: Row(
        spacing: 4,
        mainAxisAlignment: .center,
        children: [
          Icon(icon.icon),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: .bold,
            ),
          ),
        ],
      ),
    );
  }
}