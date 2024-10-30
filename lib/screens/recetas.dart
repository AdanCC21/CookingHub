import 'package:flutter/material.dart';
import 'package:testing_1/screens/listaCompras.dart';
import 'package:testing_1/screens/chatBot.dart';

class recetas extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _recetas();
}

class _recetas extends State<recetas>{
  @override
  Widget build(BuildContext context) {
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
          // Titulo de Recetas
          Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            margin: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10
            ),

            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Recetas", style: 
              TextStyle(color: Colors.white, fontFamily: "Poppins", 
              fontSize: 36, fontWeight: FontWeight.bold),)],
            ),
          ),

          // Secciones
          Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),

            margin: const EdgeInsets.only(
              top: 80,
              left: 10,
              right: 10
            ),

            child: Column(
              children: [
                // --------- Lista superior
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ---- Chat
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      width: 140,
                      height: 100,
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> chatBot()));
                        } ,icon: const Icon(Icons.chat)),
                        const Text("Chat"),
                        ],
                      ),
                    ),
                    // ----- Camara
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      width: 140,
                      height: 100,
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> chatBot()));
                        }, icon: Icon(Icons.camera_alt_rounded)),
                        const Text("Camara")
                        ],
                      ),
                    ),
                  ],
                ),
                // --------- Favoritos
                Row(
                 mainAxisAlignment: MainAxisAlignment.center, 
                 children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),

                    margin: EdgeInsets.all(16),

                    child: Text("Favoritos"),
                  )
                 ],
                ),
                // --------- Recetas semanales 
                Row(
                 mainAxisAlignment: MainAxisAlignment.center, 
                 children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),

                    margin: EdgeInsets.all(16),

                    child: Text("Recetas semanales"),
                  )
                 ],
                )
              ],
            ),
          ),


          // Hot Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              
              decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 170, 50, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16)
                )
              ),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){}, icon: Image.asset("assets/HotBar/Home.png",width: 30,)),
                  IconButton(onPressed: (){}, icon: Image.asset("assets/HotBar/Games.png",width: 30,)),
                  const SizedBox(width: 60,),
                  IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => listaScreen()));}, 
                  icon: Image.asset("assets/HotBar/Lista.png",width: 30,),),
                  IconButton(onPressed: (){}, icon: Image.asset("assets/HotBar/Perfil.png",width: 30,)),
                ],
              ),
            ),
          ),
          
          // Icono central
          Align(
            alignment: Alignment.bottomCenter,
            child: Positioned(
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> recetas()));
              },
              padding: const EdgeInsets.only(
                bottom: 2
              ), 
              icon: Image.asset("assets/HotBar/Gorrito.png",width: 50,)) ,
              ),
          )
        ],
      ),
    ));
  }
}