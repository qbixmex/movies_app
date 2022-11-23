import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  final String title;

  const CardSwiper({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      color: Colors.red,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.left,
      ),
    );
  }
}