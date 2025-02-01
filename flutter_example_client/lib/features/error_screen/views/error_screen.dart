import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {super.key});
  final Exception error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.toString(),
              textScaler: TextScaler.linear(1.5),
            ),
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text(
                'Home',
                textScaler: TextScaler.linear(1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
