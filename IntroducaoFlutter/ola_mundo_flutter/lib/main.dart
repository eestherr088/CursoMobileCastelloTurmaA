import 'package:flutter/material.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(Object context) {
    return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text("Olá Mundo")
      ),
    )
   );
  }
  
}