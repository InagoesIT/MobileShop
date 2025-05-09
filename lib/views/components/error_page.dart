import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final void Function()? onRetry;
  final String message;

  const ErrorPage({super.key, this.onRetry, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 48),
            SizedBox(height: 16),
            Text('Failed to load product details'),
            SizedBox(height: 48),
            ElevatedButton(onPressed: onRetry, child: Text('Retry')),
          ],
        ),
      ),
    );
    ;
  }
}
