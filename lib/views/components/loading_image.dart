import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  final EdgeInsets padding;

  const LoadingImage({super.key, required this.padding});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
    padding: padding,
    strokeWidth: 2,
  );
  }
}