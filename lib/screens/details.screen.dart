import 'package:flutter/material.dart';
import 'package:movies_app/themes/themes.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO Movie Instance

    final String movie =
      ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAddBar(),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              _PosterAndTitle(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAddBar extends StatelessWidget {
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
          color: Colors.black12,
          child: const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Movie Title',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: AssetImage('assets/images/500x300.png'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/images/no-image.jpg'),
            image: AssetImage('assets/images/200x300.png'),
            height: 150,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hero Academy',
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              '(僕のヒーローアカデミア)',
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 15),
            Row(children: const <Widget>[
              Icon(Icons.star, color: AppTheme.iconColor1),
              Icon(Icons.star, color: AppTheme.iconColor1),
              Icon(Icons.star, color: AppTheme.iconColor1),
              Icon(Icons.star_outline, color: AppTheme.iconColor1),
              Icon(Icons.star_outline, color: AppTheme.iconColor1),
            ]),
            const SizedBox(height: 5),
            Row(children: <Widget>[
              Text(
                'Average:',
                style: textTheme.caption,
              ),
              const SizedBox(width: 5),
              Text(
                '3',
                style: textTheme.caption,
              ),
            ]),
          ],
        )
      ]),
    );
  }
}