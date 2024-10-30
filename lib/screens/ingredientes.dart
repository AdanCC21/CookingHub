import 'package:flutter/material.dart';

class ingredientes extends StatefulWidget{
  const ingredientes({super.key});

  @override
  State<StatefulWidget> createState() => _ingredientes();
}

class _ingredientes extends State<ingredientes>{
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          // Fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/Background.png"),
              fit: BoxFit.cover)
            ),
          ),
        ],
      ),
    ));
  }
}
