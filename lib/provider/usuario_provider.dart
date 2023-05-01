import 'dart:convert';
import 'package:http/http.dart';
import 'package:proyecto_ciclista/models/Character.dart';


class HttpService {

//aqui iria la url para sacar los usuarios (llamar a la api)
  final String url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter() async {
    Response res = await get(Uri.parse(url));

    if(res.statusCode == 200) {
      return Character.fromJson(json.decode(res.body));

    } else {
      throw Exception('Error');
    }
  }

  Future<List<Character>> getPersonajes() async{
    Response res = await get(Uri.parse(url));
    if(res.statusCode == 200){
      // 1- Pasar el json a List<dinamic> porque me permite iterar
      List<dynamic> lista = jsonDecode(res.body)['results'];
      // 2- Ahora puedo iterar para pasar cada elemento de la lista a tipo character
      List<Character> characters = lista.map((item) => Character.fromJson(item)).toList();

      return characters;

    } else {
      throw Exception('Fallo');
    }
  }
}