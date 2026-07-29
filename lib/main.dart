import 'package:flutter/material.dart';
import 'features/home/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnCorto Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.purple),
      ),
      home: const HomeScreen(),
    );
  }
}
