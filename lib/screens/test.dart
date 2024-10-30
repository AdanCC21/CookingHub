import 'package:flutter/material.dart';

class DeslizableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contenedor Deslizable"),
      ),
      body: Stack(
        children: [
          Center(
            child: Text("Contenido principal de la pantalla"),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.1, // Tamaño inicial del contenedor
            minChildSize: 0.1, // Tamaño mínimo cuando está deslizado hacia abajo
            maxChildSize: 0.9, // Tamaño máximo cuando está deslizado hacia arriba
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Arrastra hacia arriba para expandir",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Puedes agregar aquí más contenido para llenar el contenedor
                    ListTile(
                      leading: Icon(Icons.star, color: Colors.white),
                      title: Text("Item 1", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.star, color: Colors.white),
                      title: Text("Item 2", style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      leading: Icon(Icons.star, color: Colors.white),
                      title: Text("Item 3", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
