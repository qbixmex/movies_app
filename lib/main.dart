import 'package:flutter/material.dart';
import 'package:movies_app/themes/themes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('Mexflix')),
        body: const Center(child: Text('Mexflix'),)
      ),
    );
  }
}

