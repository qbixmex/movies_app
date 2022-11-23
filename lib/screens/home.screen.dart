import 'package:flutter/material.dart';
import 'package:movies_app/themes/themes.dart';

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
