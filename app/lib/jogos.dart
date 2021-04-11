import 'package:flutter/material.dart';

class Jogos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset("assets/iBet_logo.png")),
        title: Text("Jogos"),
      ),
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/jogos/cacaniquel');
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
    );
  }
}
