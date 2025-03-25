import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Exemplo de Layout")),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(  // pilha, um em cima do outro
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: 
                  Image.network(
                  'https://cdn.shopify.com/s/files/1/1426/3142/files/65ef9d39-9fcb-4c0d-aa0e-a147778c9858_480x480.png?v=1685124178',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.green,
                  height: 100,
                  width: 100,
                ),
                ClipOval(
                  child: Image.asset(
                  "assets/img/kuromi.png",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                ),
                ),
                Container(
                  color: Colors.yellow,
                  height: 100,
                  width: 100,),
                Container(
                  color: Colors.orange,
                  height: 100,
                  width: 100,)
              ],
            ),
            Text("Obervações Importantes")
          ]
        ),
      ),
    );
  }
}