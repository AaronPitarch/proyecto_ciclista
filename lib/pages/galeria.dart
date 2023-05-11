//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:proyecto_ciclista/data/images_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_ciclista/services/galeria_service.dart';
import 'package:proyecto_ciclista/services/select_image_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class Galeria extends StatefulWidget {
  const Galeria({super.key});

  @override
  State<Galeria> createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {

  final galeriaService galeriaServ = galeriaService();
  List<String> imagenList = [];
  final ImagePicker picker = ImagePicker();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    cargarImagenes();

    final androidInitializationSettings = AndroidInitializationSettings('app_icon');
    final initializationSettings = InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> cargarImagenes() async {
    final galeriaServicio = galeriaService();
    final listaImagenes = await galeriaServicio.obtenerImagenes();
    setState(() {
      imagenList = listaImagenes;
    });
  }
/*
  Future<void> cargarImagenes() async {
    final listaImagenes = await galeriaService.obtenerImagenes();
    setState(() {
      imagenList = listaImagenes;
    });
  }*/

  Future<void> getImage() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    
    if (image != null) {
      await showDialog(
        context: context, 
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('¿Donde deseas guardar la imagen?'),
            content: const Text('Elige la opcion'),
            actions: [
              CupertinoDialogAction(
                child: const Text('Galeria interna'),
                onPressed: () {
                  // Aqui va la logica para guardar la imagen en la galeria
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: const Text('En la nube de la peña'),
                onPressed: () async {
                  // Subir la imagen al almacenamiento de Firebase
                  final file = File(image.path);
                  final imageName = DateTime.now().millisecondsSinceEpoch.toString();
                  final Reference storageReference = FirebaseStorage.instance.ref().child('imagenes/$imageName');
                  final UploadTask uploadTask = storageReference.putFile(file);
                  await uploadTask.whenComplete(() {
                    print('Imagen subida correctamente');
                    showNotification();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('channel_id', 'channel_name',
            importance: Importance.max, priority: Priority.high);
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, 'Subida exitosa', 'La imagen se ha subido correctamente a Firebase.', platformChannelSpecifics);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: GridView.builder(
        itemCount: imagenList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(imagenList[index]);
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.camera), 
        ),
        




    /* Lista de imagenes desde carpeta data 
      body: GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(5.0),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: _imageList,
        ),*/
    );
  }
}

/*
  List<Widget> get _imageList {
    List<Widget> listImages = [];
    
    for(var image in images) {
      listImages.add(GestureDetector(
        child: Image.network(image, fit: BoxFit.cover,)));
    }

    return listImages;
  }
  */