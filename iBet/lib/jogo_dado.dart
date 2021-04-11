import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class CacaNiquel extends StatefulWidget {
  _CacaNiquelState createState() => _CacaNiquelState();
}

class _CacaNiquelState extends State<CacaNiquel> {
  List listaJogadores = [];
  final inputJogador1 = TextEditingController();
  final inputJogador2 = TextEditingController();
  final inputJogador3 = TextEditingController();
  final inputJogador4 = TextEditingController();
  final inputJogador5 = TextEditingController();
  final inputJogador6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final double total_2 = ModalRoute.of(context).settings.arguments as double;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Insira o nome dos participantes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: TextField(
                controller: inputJogador1,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    hintText: "Jogador 1"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: TextField(
                controller: inputJogador2,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    hintText: "Jogador 2"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: TextField(
                controller: inputJogador3,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    hintText: "Jogador 3"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: TextField(
                controller: inputJogador4,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    hintText: "Jogador 4"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: TextField(
                controller: inputJogador5,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    hintText: "Jogador 5"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
              child: TextField(
                controller: inputJogador6,
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    hintText: "Jogador 6"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          if (inputJogador1.text != "") {
            listaJogadores.add(inputJogador1.text);
          }
          if (inputJogador2.text != "") {
            listaJogadores.add(inputJogador2.text);
          }
          if (inputJogador3.text != "") {
            listaJogadores.add(inputJogador3.text);
          }
          if (inputJogador4.text != "") {
            listaJogadores.add(inputJogador4.text);
          }
          if (inputJogador5.text != "") {
            listaJogadores.add(inputJogador5.text);
          }
          if (inputJogador6.text != "") {
            listaJogadores.add(inputJogador6.text);
          }

          if (listaJogadores.length >= 2) {
            Navigator.pushNamed(context, '/jogos/cacaniquel/play',
                arguments: Dados(listaJogadores, total_2));
          } else {
            listaJogadores = [];
            AlertDialog(content: Text("É necessário pelo menos 2 jogadores"));
          }
        },
        child: Icon(Icons.check, color: Colors.red),
      ),
    );
  }
}

class CacaNiquelJogo extends StatefulWidget {
  _CacaNiquelJogoState createState() => _CacaNiquelJogoState();
}

class _CacaNiquelJogoState extends State<CacaNiquelJogo> {
  @override
  final List<String> resultado = [];
  String texto = "";
  String sorteado = "";
  int indice = 1;

  Widget build(BuildContext context) {
    final Dados part = ModalRoute.of(context).settings.arguments as Dados;
    final listaJ = part.nomes;
    final total = part.total;

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset("assets/iBet_logo.png"),
          )
        ],
        title: Text("Caça Níquel"),
      ),
      body: Column(
        children: [
          IntrinsicHeight(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Image.asset("assets/Jogo_bg.png"),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 180.0),
                    child: Text(
                      "$sorteado",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            child: Text(
              "Sorteados",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "$texto",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          if (listaJ.length > 0) {
            Random rnd = new Random();
            int i = rnd.nextInt(listaJ.length);
            resultado.add(listaJ[i]);
            setState(() {
              texto = texto + " ${listaJ[i]}\n";
              sorteado = "${listaJ[i]}";
            });
            listaJ.removeAt(i);
          } else {
            Navigator.pushNamed(context, '/resultado',
                arguments: Dados(resultado, total));
          }
        },
        child: Image.asset("assets/confirm_gameIcon.png"),
      ),
    );
  }
}

class Dados {
  final List nomes;
  final double total;

  Dados(this.nomes, this.total);
}
