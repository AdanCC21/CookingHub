import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing_1/screens/listaCompras.dart';
import 'package:testing_1/screens/recetas.dart';
import 'package:testing_1/screens/recetasDetectadas.dart';
import 'package:flutter/services.dart';
import 'dart:io';


class chatBot extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _chatBot();
}

class _chatBot extends State<chatBot>{
  
  // ---- Camara
  
  File? image_captured;

  Future<void> _openCamera() async{
    final picker = ImagePicker();
    final image_picker = await picker.pickImage(source: ImageSource.camera);

    if(image_picker != null){
      setState(() {
        image_captured = File(image_picker.path);
      });
    }

  }

  // ---- Galeria
  /*
    Future dice que sera una funcion que tomara tiempo, en este caso tomara tiempo en abrir la galeria y seleccionar una imagen
    async hace que la funcion sea asincrona, que permite usar el await, que este await permite esperar una respuesta a una operacion que toma tiempo
    en este caso await espera a que pickImage de respuesta
  */
  Future<void> _openGallery() async{
    final picker = ImagePicker();
    final image_file = await picker.pickImage(source: ImageSource.gallery);
    
    if(image_file != null){
      // Usamos setState para actualizar el ui de la aplicacion, es decir actualizar o refrescar la imagen
      setState(() {
        image_captured = File(image_file.path);
      });
    }
  }

  // ---- Texto

  // Control de entrada de texto
  final TextEditingController _controller = TextEditingController();

  String mensaje = '';

  void promp(String texto){
    setState(() {
      mensaje = texto;
      // Limpiamos el cuadro de texto
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
          body: Stack(
            children: [
              // Fondo
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/Background.png"),
                  fit: BoxFit.cover)
                ),
              ),
              
              // Cuadro de fondo + Entrada de texto
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

                  // -- Cuadro de texto
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white
                        ),
                        // -- Cuando presione enter
                        onSubmitted: promp,
                      ),
                    ],
                  ),
                )
              ),
              
              // Contenedor del chat --------
              Container(
                // ------------- COMENTARIO -------------
                // Cuando implementen el codigo del chat aqui sera el contenedor donde estara,
                // quitale el color de fondo por ahora es solo para resaltarlo de los demas
                decoration: const BoxDecoration(
                  color: Colors.white,

                ),
                width: double.maxFinite,
                margin: const EdgeInsets.only(
                  top: 110,
                  left: 10,
                  right: 10,
                  bottom: 140
                ),

                child: Column(
                  children: [
                    Text("Aqui ira el chat, Mensaje actual $mensaje"),

                    if(image_captured != null)
                      Image.file(image_captured!)
                    
                  ],
                ),
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
                      // Adjuntar
                      IconButton(onPressed:(){
                        _openGallery();
                      }, iconSize: 
                      35,
                      icon: const Icon(Icons.add_photo_alternate, color: Colors.white,)),
                      // Abrir camara
                      IconButton(onPressed:(){
                        _openCamera();}, 
                      iconSize: 35,
                      icon: const Icon(Icons.camera_alt_rounded, color: Colors.white,)),
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
                    children: [Text("CookBot",style: TextStyle(color: Colors.white,fontSize: 64,
                    fontFamily: 'Poppins',fontWeight: FontWeight.bold),),],
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
                  child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> recetas()));
                  },
                  padding: const EdgeInsets.only(
                    bottom: 2
                  ), 
                  icon: Image.asset("assets/HotBar/Gorrito.png",width: 50,)) ,
                  ),
              ),
              
            ],
          ),
        ),
      )
    );
  }
}
