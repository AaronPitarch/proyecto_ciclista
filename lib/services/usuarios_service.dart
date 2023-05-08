import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_ciclista/models/usuario.dart';

class UsuariosService {
  static final CollectionReference usuariosCollection = FirebaseFirestore.instance.collection('usuarios');

  static Future<List<Usuario>> todosUsuarios() async {
    QuerySnapshot snapshot = await usuariosCollection.orderBy('puntos', descending: true).get();
    return snapshot.docs.map((e) => Usuario(
      nombre: e['nombre'],
      puntos: e['puntos'],
      imagen: e['imagen']
    )).toList();
  }
}
