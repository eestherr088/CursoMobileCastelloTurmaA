//classes

import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(//1º Camada
      appBar: AppBar(title: Text("Bem-vindo!!!"),centerTitle: true,),
      body: Center(  // 2° camada
        child: Column(  // 3° camada
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Aplicativos de Cadastro de Usuário", style: TextStyle(fontSize:20),),
            SizedBox(height: 20,),
            ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/cadastro"),
            child: Text("Cadastro de Usuário"))
          ],
        ),
      ),
    );
  }
}