import 'package:flutter/material.dart';
import 'package:proyecto_ciclista/pages/drawer/navigation_drawer.dart';

import '../models/noticia.dart';
import '../services/noticias_service.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
      //title: const Text('Drawer Demo'),
      ), 

      body: FutureBuilder<List<Noticia>>(
        future: NoticiasService.obtenerTodas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(snapshot.data![index].imagen),
                      ListTile(
                        title: Text(snapshot.data![index].titulo),
                        //subtitle: Text(snapshot.data![index].descripcion),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error al obtener las noticias'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}