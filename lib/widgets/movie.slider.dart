import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import '../themes/themes.dart';

class MovieSlider extends StatelessWidget {

  final List<Movie> _movies;
  final String? _title;

  const MovieSlider({
    super.key,
    required List<Movie> movies,
    String? title,
  }):
    _title = title,
    _movies = movies;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (_movies.isEmpty) {
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
        height: 270,
        child: Column(        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_title != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  _title!,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _movies.length,
                itemBuilder: (_, i) {
                return _MoviePost(movie: _movies[i]);
                },
              ),
            ),
          ],
        ),
      );
  }
}

class _MoviePost extends StatelessWidget {

  final Movie _movie;

  const _MoviePost({
    required Movie movie,
  }): _movie = movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'details',
              arguments: 'movie-instance',
            ),
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
