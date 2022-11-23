import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mexflix')),
      body: Center(
        child: Text(
          'Mexflix',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
