import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclista/services/rutas_service.dart';
import 'package:proyecto_ciclista/models/rutas.dart';

class Rutas extends StatelessWidget {
  const Rutas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Container(
        child: FutureBuilder<List<Ruta>>(
          future: RutasService.getAllRutas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final rutas = snapshot.data;
              return ListView.builder(
                itemCount: rutas?.length,
                itemBuilder: (context, index) {
                  final ruta = rutas![index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Fila 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ruta.titulo,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${ruta.fecha.day}/${ruta.fecha.month}/${ruta.fecha.year}',
                            ),
                          ],
                        ),
                        // Fila 2
                        Row(
                          children: [
                            Text('KM: ${ruta.kilometros}'),
                            const SizedBox(width: 16),
                            Text('DESNIVELL: ${ruta.desnivel}'),
                            const SizedBox(width: 16),
                            Text('PUNTOS: ${ruta.puntos}'),
                          ],
                        ),
                        // Fila 3
                        Column(
                          children: [
                            Image.network(
                              ruta.imagen,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 16),
                            Text(ruta.descripcion),
                          ],
                        ),
                        // Fila 4
                        Row(
                          children: [
                            const Text('ALTERNATIU:', style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 16),
                            Text(ruta.alternativo),
                          ],
                        ),
                        // Fila 5
                        Text(
                          ruta.alternativo,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Ha ocurrido un error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}