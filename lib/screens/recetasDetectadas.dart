import 'package:flutter/material.dart';
import 'package:testing_1/screens/listaCompras.dart';
import 'package:testing_1/screens/recetas.dart';

class recetasDetectadas extends StatefulWidget{
  const recetasDetectadas({super.key});

  @override
  State<StatefulWidget> createState() => _recetasDetectadas();
}

class _recetasDetectadas extends State<recetasDetectadas>{
  
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          // Imagen de Fondo 
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/Background.png"),
              fit: BoxFit.cover)
            ),
          ),
          
          // Fondo con el listado de recetas
          Container(
            decoration: const BoxDecoration(
              
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),

            margin: const EdgeInsets.only(
              top: 70,
              right: 10,
              left: 10,
              bottom: 60
            ),

            width: double.maxFinite,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    // ----- Por ahora ira a recetas pero hay que cambiar la ruta
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> recetas()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    margin:const EdgeInsets.all(5),
                    width: screenWidth*0.8,
                    
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("Receta1",style: TextStyle(color: Colors.white, 
                    fontFamily: "Poppins", fontSize: 26),),
                    Image.asset("assets/iconos/eat.png",width: 30,)
                    ],),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> recetas()));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    margin:const EdgeInsets.all(5),
                    width: screenWidth*0.8,

                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("Receta2",style: TextStyle(color: Colors.white, 
                    fontFamily: "Poppins", fontSize: 26),),
                    Image.asset("assets/iconos/eat.png",width: 30,)
                    ],),
                  ),
                ),
              ],
            ),

          ),
          
          // Titulo de Recetas
          Container(
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            
            margin: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10
            ),

            width: double.infinity,
            height: screenHeight*0.08,
            
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Recetas",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36),)],
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
                child: IconButton(onPressed: (){},
                padding: const EdgeInsets.only(
                  bottom: 2
                ), 
                icon: Image.asset("assets/HotBar/Gorrito.png",width: 50,)) ,
                ),
            ),
        ],
      ),
    )
    );
  }
}