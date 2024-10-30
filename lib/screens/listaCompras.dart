import 'package:flutter/material.dart';


class listaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _listaScreen();
}

class _listaScreen extends State<listaScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/Background.png"),
                fit: BoxFit.cover)
              ),
            ),
          ],
        )
      ),
    );
  }
}
