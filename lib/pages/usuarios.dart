import 'package:flutter/material.dart';
import 'package:proyecto_ciclista/models/Character.dart';
import 'package:proyecto_ciclista/provider/usuario_provider.dart';

class Usuarios extends StatelessWidget {
  const Usuarios({super.key});

  @override
  Widget build(BuildContext context) {

    final HttpService http = HttpService();
    //List<Usuario> listaUsuarios = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: FutureBuilder(
        // Es donde vamos a recibir los datos de tipo Future
        future: http.getPersonajes(),
        builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot){
          // 1- Comprobar si ya tenemos los datos o no
          if(snapshot.hasData){
            // Pintar la lista de personajes
            List<Character> chars = snapshot.data!;
            // Ahora iteramos la lista y pintamos un card por cada elemento
            return ListView(
              children: chars.map((Character char) => 
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Image(image: NetworkImage(char.image ?? ''),
                          // double.infinity es lo max que pueda dentro del contenedor
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        
                        ListTile(
                          title: Text(char.name!),
                          subtitle: Text(char.location!.name!),
                        )
                      ],
                    ),
                  )).toList(),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}