
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void mian() {  // onde roda minha aplicação
  runApp(MaterialApp(  // widget principal (elementos visuais) - raiz do meu aplicaivo
    // home page
    home: PerfilPage(),
    // configurações de rota
    // route:{},  // mais de uma página
    //cofiguração de tema
  ));
}

// minha classe para o perfil page

class PerfilPage extends StatefulWidget{
  @override
  State<PerfilPage> createState() => _PerfilPageState();  // chama as modificações das telas
}

class _PerfilPageState extends State<PerfilPage>{
  // atributos
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  String? _corSelecionada;  // no momento nao selecionou a cor
  Color _corFundo = Color.white;

  String? _nomeSalvo;
  String? _idadeSalva;
  String? _corSalva;

  final Map<String, Color> coresDisponiveis = {
    "Azul": Colors.blue,
    "Verde": Colors.green,
    "Vermelho": Colors.red,
    "Amarelo": Colors.yellow,
    "Cinza": Colors.grey
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarDados();
  }

  _carregarDados() async { //conectar com Shared Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();  // criei a conexão com shared preferences (já pega as informções salvas)
    setState(() {  // mudança de estado ()
    _nomeSalvo = prefs.getString("nome");  // pega o nome salvo no shared_preferences
    _idadeSalva = prefs.getString("idade");
    _corSalva = prefs.getString("cor");
    if(_corSalva != null && coresDisponiveis.containsKey(_corSalva!)){
      _corFundo = coresDisponiveis[_corSalva!]!;
      }
    });
  }
  _salvarDados() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();  // conecta com o cache
    await prefs.setString("nome", _nomeController.text.trim());
    await prefs.setString("idade", _idadeController.text.trim());
    await prefs.setString("cor", _corSelecionada ?? "Azul");

    setState(() {
      _nomeSalvo = _nomeController.text.trim();
      _idadeSalva = _idadeController.text.trim();
      _corSalva = _corSelecionada ?? "Azul";
      _corFundo = _coresDisponiveis[_corSalva!]!;  // permitir nulo
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: _corFundo,
      appBar: AppBar(
        title: Text("Meu Perfil Persistente"),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(labelText: "Idade"),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            SizedBox(height: 15,),
            DropdownButtonFormField(
              value: _corSelecionada,
              decoration: InputDecoration(labelText: "Cor Favorita"),
              items: coresDisponiveis.keys.map((cor){
                return DropdownMenuItem(
                  value: cor,
                  child:Text(cor));
              }).toList(), 
              onChanged: (valor){
                setState(() {
                  _corSelecionada = valor;
                });
              }),
              SizedBox(height: 16,),
            Divider(),
            Text("Dados Salvos: "),
            if (_nomeSalvo != null)
              Text("Nome: $_nomeSalvo"),
            if (_nomeSalvo != null)
              Text("Idade: $_idadeSalva"),
            if (_nomeSalvo != null)
              Text("Cor: $_corSalva"),

          ],
        ),
        ),
    );
  }
  

}