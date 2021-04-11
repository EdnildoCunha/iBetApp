import 'package:flutter/material.dart';
import 'package:iBet/jogo_dado.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Resultado extends StatelessWidget {
  String texto_final = "";
  List valor_final = [];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final Dados part = ModalRoute.of(context).settings.arguments as Dados;
    final List resultado_final = part.nomes;
    final double total_final = part.total;

    if (resultado_final.length == 2) {
      valor_final.add(total_final * 0.6);
      valor_final.add(total_final * 0.4);
    } else if (resultado_final.length == 3) {
      valor_final.add(total_final * 0.4);
      valor_final.add(total_final * 0.35);
      valor_final.add(total_final * 0.25);
    } else if (resultado_final.length == 4) {
      valor_final.add(total_final * 0.35);
      valor_final.add(total_final * 0.30);
      valor_final.add(total_final * 0.25);
      valor_final.add(total_final * 0.10);
    } else if (resultado_final.length == 5) {
      valor_final.add(total_final * 0.30);
      valor_final.add(total_final * 0.25);
      valor_final.add(total_final * 0.20);
      valor_final.add(total_final * 0.15);
      valor_final.add(total_final * 0.10);
    } else if (resultado_final.length == 6) {
      valor_final.add(total_final * 0.30);
      valor_final.add(total_final * 0.25);
      valor_final.add(total_final * 0.20);
      valor_final.add(total_final * 0.15);
      valor_final.add(total_final * 0.10);
      valor_final.add(0);
    }

    NumberFormat formatter = NumberFormat(".00");

    for (int i = 0; i < resultado_final.length; i++) {
      num.parse(valor_final[i].toStringAsPrecision(2));
      texto_final = texto_final +
          "${resultado_final[i]} - " +
          "R\$" +
          " ${formatter.format(valor_final[i])}\n";
    }

    return Scaffold(
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
        title: Text("Resultado"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/resultado_fogos.gif",
                height: 200,
              ),
            ),
            Text(
              "Resultados",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                decoration: TextDecoration.underline,
                decorationColor: Colors.yellow,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            Text(
              "$texto_final",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
