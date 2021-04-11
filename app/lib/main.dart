import 'package:app/Resultado.dart';
import 'package:app/jogo_dado.dart';
import 'package:app/jogos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iBet',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/jogos': (context) => Jogos(),
        '/jogos/cacaniquel': (context) => CacaNiquel(),
        '/jogos/cacaniquel/play': (context) => CacaNiquelJogo(),
        '/resultado': (context) => Resultado(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _valorSlider = 10;
  double _total;

  final inputTotal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset("assets/iBet_logo.png")),
        title: Text("Aposta"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: inputTotal,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  hintText: "Total da conta"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              value: _valorSlider,
              min: 10,
              max: 100,
              divisions: 18,
              onChanged: (double valor) {
                setState(() {
                  _valorSlider = valor;
                });
              },
            ),
          ),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$_valorSlider",
                      style: TextStyle(
                        fontSize: 190,
                        color: Colors.white,
                      ),
                    ),
                    Text("%",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                        )),
                  ],
                ),
                Text(
                  "do valor total da conta será apostado:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          _total = double.parse(inputTotal.text) * (_valorSlider / 100);
          print("$_total");
          Navigator.pushNamed(context, '/jogos');
        },
        child: Icon(Icons.check, color: Colors.red),
      ),
    );
  }
}
