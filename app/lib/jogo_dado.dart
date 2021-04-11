import 'package:flutter/material.dart';
import 'dart:math';

class CacaNiquel extends StatefulWidget {
  _CacaNiquelState createState() => _CacaNiquelState();
}

class _CacaNiquelState extends State<CacaNiquel> {
  int _participantes;
  final List listaJogadores = [];
  final inputJogador1 = TextEditingController();
  final inputJogador2 = TextEditingController();
  final inputJogador3 = TextEditingController();
  final inputJogador4 = TextEditingController();
  final inputJogador5 = TextEditingController();
  final inputJogador6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: inputJogador1,
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
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: inputJogador2,
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
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: inputJogador3,
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
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: inputJogador4,
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
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: inputJogador5,
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
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: inputJogador6,
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
          if (inputJogador1 != null) {
            listaJogadores.add(inputJogador1.text);
          }
          if (inputJogador2 != null) {
            listaJogadores.add(inputJogador2.text);
          }
          if (inputJogador3 != null) {
            listaJogadores.add(inputJogador3.text);
          }
          if (inputJogador4 != null) {
            listaJogadores.add(inputJogador4.text);
          }
          if (inputJogador5 != null) {
            listaJogadores.add(inputJogador5.text);
          }
          if (inputJogador6 != null) {
            listaJogadores.add(inputJogador6.text);
          }
          print(listaJogadores); // TESTEEEEE
          Navigator.pushNamed(context, '/jogos/cacaniquel/play');
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
  final List<String> listaJ = ["Hilton", "Ed", "Rafael"];
  final List<String> resultado = [];
  String texto = "";
  int indice = 1;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          IntrinsicHeight(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [Image.asset("assets/Jogo_bg.png")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
            });
            listaJ.removeAt(i);
          } else {
            Navigator.pushNamed(context, '/resultado');
          }
        },
        child: Image.asset("assets/confirm_gameIcon.png"),
      ),
    );
  }
}
