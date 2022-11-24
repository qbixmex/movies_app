import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 190,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => _CastCard(),
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 110,
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/images/no-image.jpg'),
            image: AssetImage('assets/images/150x300.png'),
            width: 100,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Actor Name',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}