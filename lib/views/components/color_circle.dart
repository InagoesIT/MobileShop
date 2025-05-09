import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  final Color? color;

  const ColorCircle({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child:
          color == null
              ? Icon(Icons.close, size: 12, color: Colors.grey)
              : null,
    );
  }
}
