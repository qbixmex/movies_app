import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import '../themes/themes.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> _movies;
  final String? _title;
  final void Function() _onNextPage;

  const MovieSlider({
    super.key,
    required List<Movie> movies,
    String? title,
    required void Function() onNextPage,
  }):
    _title = title,
    _movies = movies,
    _onNextPage = onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final scrollController = ScrollController();
  late double currentScrollValue;
  late double maxScrollValue;

   @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      currentScrollValue = scrollController.position.pixels;
      maxScrollValue = scrollController.position.maxScrollExtent;

      if (currentScrollValue >= maxScrollValue - 500) {
        widget._onNextPage();
      }
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (widget._movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator(
          color: AppTheme.primary,
        )),
      );
    }

    return SizedBox(
        width: double.infinity,
        height: 280,
        child: Column(        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget._title != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget._title!,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget._movies.length,
                itemBuilder: (_, index) {
                  return _MoviePoster(
                    movie: widget._movies[index],
                    heroId: '${widget._title}-$index-${widget._movies[index].id}',
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie _movie;
  final String _heroId;

  const _MoviePoster({
    required Movie movie,
    required String heroId,
  }):
    _movie = movie,
    _heroId = heroId;

  @override
  Widget build(BuildContext context) {

    _movie.heroId = _heroId;

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: _movie),
            child: Hero(
              tag: _movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(_movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}
