import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

//criar a Janela Principal
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lista de imagens iniciais
  List<String> _imagens = [
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
    "https://images.unsplash.com/photo-1518837695005-2083093ee35b",
    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29",
    "https://images.unsplash.com/photo-1519681393784-d120267933ba",
    "https://images.unsplash.com/photo-1531259683007-016a7b628fc3",
    "https://images.unsplash.com/photo-1506619216599-9d16d0903dfd",
    "https://images.unsplash.com/photo-1494172961521-33799ddd43a5",
    "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4",
  ];

  // Controlador do TextField para pegar o URL
  final TextEditingController _urlController = TextEditingController();

  // Função para adicionar uma nova imagem
  void _adicionarImagem() {
    setState(() {
      if (_urlController.text.isNotEmpty) {
        _imagens.add(_urlController.text); // Adiciona o URL na lista de imagens
      }
      _urlController.clear(); // Limpa o campo após adicionar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeria de Imagens"),
        centerTitle: true,
      ), // Barra superior do App
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // Barra de inserção de URL
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _urlController,
                      decoration: InputDecoration(
                        labelText: "Digite a URL da imagem",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _adicionarImagem, // Adiciona a imagem à lista
                  ),
                ],
              ),
            ),
            // Carrossel de Imagens com rolagem automática
            CarouselSlider(
              options: CarouselOptions(height: 300, autoPlay: true),
              items: _imagens.map(
                (url) => Container(
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(url, fit: BoxFit.cover, width: 1000),
                  ),
                ),
              ).toList(),
            ), // Fim do carrossel
            // Galeria de imagens em uma grade
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Quantidade de imagens por linha
                  crossAxisSpacing: 8, // Espaçamento entre colunas
                  mainAxisSpacing: 8, // Espaçamento entre linhas
                ),
                itemCount: _imagens.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _mostrarImagem(context, _imagens[index]), // Exibe a Imagem em tela cheia ao tocar
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(_imagens[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para mostrar a imagem em tela cheia
  void _mostrarImagem(BuildContext context, String imagem) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(imagem),
      ),
    );
  }
}