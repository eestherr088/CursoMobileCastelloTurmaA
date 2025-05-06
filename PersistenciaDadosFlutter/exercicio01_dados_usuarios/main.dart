import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StateFulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// estado do widget principal
class _MyAppState extends State<MyApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController(); 
}

// variáveis para armazenar as seleções atuais e os dados salvos
