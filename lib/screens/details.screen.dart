import 'package:flutter/material.dart';
import 'package:movies_app/themes/themes.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:movies_app/models/models.dart';

class DetailsScreen extends StatelessWidget {

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAddBar(movie),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              _PosterAndTitle(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              const CastingCards(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAddBar extends StatelessWidget {

  final Movie movie;

  const _CustomAddBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          color: Colors.black26,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/images/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Expanded(
        child: Row(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),                
                Row(children: <Widget>[
                  Text(
                    'Average:',
                    style: textTheme.caption,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    movie.voteAverage.toString(),
                    style: textTheme.caption,
                  ),
                ]),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        movie.overview,
        style: textTheme.bodyText1,
        textAlign: TextAlign.justify,
      )
    );
  }

}