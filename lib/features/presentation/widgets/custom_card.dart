import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 30, 34, 45),
      ),
      child: Column(
        spacing: 2,
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              'https://i.ibb.co/fdQvkrCb/nachos.jpg',
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),  
          ),
          SizedBox(height: 4,),
          Column(
            spacing: 4,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: .bold,
                        backgroundColor: Colors.red,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '%45 OFF',
                    style: TextStyle(
                      fontWeight: .bold,
                      backgroundColor: Colors.lightGreen,
                      shadows: [
                        Shadow(
                          blurRadius: BorderSide.strokeAlignCenter,
                          color: Colors.amber,
                          offset: Offset.infinite,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$255',
                    style: TextStyle(
                      decoration: .lineThrough,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$225',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: .bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}