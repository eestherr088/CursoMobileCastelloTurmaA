import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

// construir a janela
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo Widget de Exibição"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Olá, Flutter!!!", 
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue)), //texto Simples
            Text("Flutter é Incrível!!!", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                letterSpacing: 2
              ),), // Texto Personalizado
            Icon(Icons.star, size: 50, color: Colors.amber,),
            IconButton(
              onPressed: ()=> print("Icone Pressionado"),
              icon: Icon(Icons.notifications, size: 50,)),
              // imagens
              Image.network("https://cdn2.unrealengine.com/Diesel%2Fproductv2%2Fbatman-arkham-knight%2FEGS_WB_Batman_Arkham_Knight_G1_1920x1080_19_0911-1920x1080-1d69e15f00cb5ab57249f208f1f8f45d52cbbc59.jpg",
              height: 300,
              width: 300,
              fit: BoxFit.cover,),
              // imagem local
              Image.asset("assets/img/coringa.png",
              height: 300,
              width: 300,
              fit: BoxFit.cover,)
          ],
        ),
      )
    );
  }
  
}