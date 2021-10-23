import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          leading: Image.network("https://www.besoftsocks.com/wp-content/uploads/2018/07/Elefante.png",
              color: Colors.white,
          ),
          title: Container(
            alignment: Alignment.center,
            child: Text("ElephantApp")
          ),          
          elevation: 20,
          shadowColor: Colors.purple[100],        
        ),
        body: Center(
          child: Container(
            child: TextButton(
              child: Text("Ver elefantes"),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}