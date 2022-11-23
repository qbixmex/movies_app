import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mexflix - Details')),
      body: Center(
        child: Text(
          'Details',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
