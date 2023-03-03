import 'package:flutter/material.dart';
import 'package:proyecto_ciclista/pages/drawer/navigation_drawer.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
      //title: const Text('Drawer Demo'),
      ), 
    );
  }
}