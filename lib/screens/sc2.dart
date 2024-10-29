import 'package:flutter/material.dart';

class listaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _listaScreen();
}

class _listaScreen extends State<listaScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
