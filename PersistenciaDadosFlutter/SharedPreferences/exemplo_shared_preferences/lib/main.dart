import 'package:flutter/material.dart';

import "tela_inicial.dart";
import 'tela_todo_list.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    theme: ThemeData(brightness: Brightness.light),
    darkTheme: ThemeData(brightness: Brightness.dark),
  routes: {
    "/tarefas": (context) => TelaTodoList(),
    "/": (context) => TelaInicial()
  },
  ));
}
