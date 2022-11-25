import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/providers/movies.provider.dart';
import 'package:movies_app/models/models.dart';

class CastingCards extends StatelessWidget {

  final int _movieId;

  const CastingCards(movieId, {super.key}): _movieId = movieId;

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(_movieId),

      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 180,
            child: const CupertinoActivityIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 190,
          child: ListView.builder(
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => _CastCard(cast[i]),
          ),
        );
      }

    );

  }

}

class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard(this.actor);

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
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/no-image.jpg'),
            image: NetworkImage(actor.fullProfilePath),
            width: 100,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          actor.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.subtitle2,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}