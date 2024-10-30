// import 'package:app_1/screens/sc2.dart';
import 'package:flutter/material.dart';
import 'package:testing_1/screens/chatBot.dart';
import 'package:testing_1/screens/ingredientes.dart';
import 'package:testing_1/screens/recetasDetectadas.dart';
import 'package:testing_1/screens/test.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  
  // El key es como un id del widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
         
        home:DeslizableScreen(),
    );
  }

}