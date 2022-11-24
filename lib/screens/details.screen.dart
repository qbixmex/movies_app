import 'package:flutter/material.dart';
import 'package:movies_app/themes/themes.dart';
import 'package:movies_app/widgets/widgets.dart';

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
              _Overview(),
              const CastingCards(),
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

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        'My Hero Academia (Japanese: 僕のヒーローアカデミア, Hepburn: Boku no Hīrō Akademia) is a Japanese superhero manga series written and illustrated by Kōhei Horikoshi.\n\nIt has been serialized in Shueisha\'s shōnen manga magazine Weekly Shōnen Jump since July 2014, with its chapters additionally collected into 36 tankōbon volumes as of October 2022.\n\nSet in a world where superpowers (called "Quirks") have become commonplace, the story follows Izuku Midoriya, a boy who was born without a Quirk but still dreams of becoming a superhero himself.\n\nHe is scouted by All Might, Japan\'s greatest hero, who bestows his Quirk to Midoriya after recognizing his potential, and helps to enroll him in a prestigious high school for superheroes in training.\n\nThe manga spawned a media franchise, having inspired numerous spin-off manga, such as My Hero Academia: Smash!!, My Hero Academia: Vigilantes and My Hero Academia: Team-Up Missions.\n\nThe series has expanded into light novels, stage plays, and various types of merchandise and media such as a trading card game and numerous video games.\n\nIt has been adapted into an anime television series produced by Bones.\n\nThe first season aired in Japan from April to June 2016, followed by a second season from April to September 2017, then a third season from April to September 2018, a fourth season from October 2019 to April 2020, a fifth season from March to September 2021, and a sixth season, which premiered in October 2022.\n\nIt has also received three animated films, titled My Hero Academia: Two Heroes, My Hero Academia: Heroes Rising, and My Hero Academia: World Heroes\' Mission, respectively.\n\nAdditionally, it has developed eight original video animations (OVAs), each bundled with a limited edition in numerous volumes of the manga. There are plans for a live-action film by Legendary Entertainment.',
        style: textTheme.bodyText1,
        textAlign: TextAlign.justify,
      )
    );
  }
}