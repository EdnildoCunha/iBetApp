import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iBet',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Aposta'),
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
  int _counter = 0;
  double _valorSlider = 10;
  //function save value count
  void _saveValue() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset("assets/iBet_logo.png")),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Total da conta"),
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
              //label: _valorSlider.round().toString(),
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
        onPressed: () {
          return _saveValue();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
