import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_ciclista/services/servicios_firebase.dart';

class Rutas extends StatelessWidget {
  Rutas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      
    );
  }
}