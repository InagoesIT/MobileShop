import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ImageError extends StatelessWidget {
  final double size;

  const ImageError({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#f8f8f8'),
      child: Center(
        child: Icon(Icons.broken_image, color: HexColor('#b0b0b0'), 
        size: size),
      ),
    );
  }
}