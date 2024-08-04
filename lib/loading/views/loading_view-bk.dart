import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoadingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: CircularProgressIndicator()),
      body: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              // SizedBox(height: 8),
              // Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }
}
