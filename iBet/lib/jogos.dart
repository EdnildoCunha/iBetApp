import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Jogos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final double total = ModalRoute.of(context).settings.arguments as double;

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
                  Navigator.pop(context);
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
        title: Text("Jogos"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Caça Niquel",
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
          Center(
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/jogos/cacaniquel',
                      arguments: total);
                },
                child: Image.asset(
                  "assets/jogo_Icon.png",
                  fit: BoxFit.cover,
                  width: 200.0,
                  height: 200.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
