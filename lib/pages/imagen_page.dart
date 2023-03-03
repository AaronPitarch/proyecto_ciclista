import 'package:flutter/material.dart';

class ImagenPage extends StatelessWidget {
  final String url;
  const ImagenPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Image.network(url),
    );
  }
}