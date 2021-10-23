import 'package:flutter/material.dart';
import 'package:partial1_elephantapp/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elephant App',
      home: HomeScreen()
    );
  }
}