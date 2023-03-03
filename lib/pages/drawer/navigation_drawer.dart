import 'package:flutter/material.dart';
import 'package:proyecto_ciclista/pages/drawer/drawer_item.dart';
import 'package:proyecto_ciclista/pages/galeria.dart';
import 'package:proyecto_ciclista/pages/usuarios.dart';

import '../rutas.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 40,),
              const Divider(thickness: 1, height: 10, color: Colors.grey),
              const SizedBox(height: 40,),
              DrawerItem(
                name: 'Usuarios',
                icon: Icons.people,
                onPressed: () => onItemPressed(context, index: 0),
              ),

              const SizedBox(height: 30,),
              DrawerItem(
                name: 'Rutas',
                icon: Icons.directions_bike,
                onPressed: () => onItemPressed(context, index: 1),
              ),

              const SizedBox(height: 30,),
              DrawerItem(
                name: 'Galeria',
                icon: Icons.collections,
                onPressed: () => onItemPressed(context, index: 2),
              ),

              const SizedBox(height: 30,),
              DrawerItem(
                name: 'Noticias',
                icon: Icons.notifications,
                onPressed: () => onItemPressed(context, index: 3),
              ),

              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                name: 'Configuraciones',
                icon: Icons.settings,
                onPressed: () => onItemPressed(context, index: 4),
              ),

              const SizedBox(height: 30,),
              DrawerItem(
                name: 'Cerrar sesion',
                icon: Icons.logout,
                onPressed: () => onItemPressed(context, index: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Usuarios()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const Rutas())));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const Galeria())));
        break;
    }
  }

  Widget headerWidget() {
    const url = 'https://img.freepik.com/vector-premium/dibujos-animados-cara-nino-lindo_18591-41509.jpg';

    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),

        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Nombre usuario', style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('correo@gmail.com', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }
}