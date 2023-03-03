import 'package:flutter/material.dart';
import 'package:proyecto_ciclista/data/images_data.dart';

class Galeria extends StatelessWidget {
  const Galeria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(5.0),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: _imageList,
        ),
    );
  }

  List<Widget> get _imageList {
    List<Widget> listImages = [];
    
    for(var image in images) {
      listImages.add(GestureDetector(
        child: Image.network(image, fit: BoxFit.cover,)));
    }

    return listImages;
  }
}