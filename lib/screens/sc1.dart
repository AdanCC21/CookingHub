import 'package:flutter/material.dart';
import 'package:testing_1/screens/sc2.dart';
import 'package:flutter/services.dart';


class chatBot extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _chatBot();
}

class _chatBot extends State<chatBot>{
  
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override 
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              // Fondo
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/Background.png"),
                  fit: BoxFit.cover)
                ),
              ),
              // Todo el cuadro de fondo
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(226, 151, 50, 1),
                  borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 16,
                  left: 5,
                  right: 5,
                  bottom: 60
                ),
                
                // El cuadro de entrada de texto
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    left: 10,
                    right: 120
                  ),

                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white
                        ),
                      ),
                    ],
                  ),
                )
              ),
              
              // Iconos de adjuntar y camara
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 75,
                    right: 10
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      IconButton(onPressed:(){}, iconSize: 35,icon: Icon(Icons.add_photo_alternate, color: Colors.white,)),
                      IconButton(onPressed:(){}, iconSize: 35,icon: Icon(Icons.camera_alt_rounded, color: Colors.white,)),
                    ],
                  ),
                ),
              ),

              // Texto de chat bot
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 168, 50, 1),
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  margin: const EdgeInsets.only(
                    top: 12,
                    left: 15,
                    right: 15,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("CookBot",style: TextStyle(color: Colors.white,fontSize: 64,fontFamily: 'Poppins',fontWeight: FontWeight.bold),),],
                  ),
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
              )
            ],
          ),
        ),
      );
  }
}
