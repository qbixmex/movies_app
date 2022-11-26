import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies.provider.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/themes/themes.dart';
import 'package:movies_app/models/models.dart';

class MovieSearchDelegate extends SearchDelegate {

  final TextStyle _textStyle2 = const TextStyle(color: AppTheme.textColor1);

  Widget _emptyContainer() {
    return const SizedBox(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.white54,
          size: 200,
        ),
      ),
    );
  }

  @override
  String get searchFieldLabel => 'Search Movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Build Result', style: _textStyle2);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty) return _emptyContainer();

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);    

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot <List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data;

        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: ListView.separated(
            separatorBuilder: (_,__) {
              return const Divider(color: AppTheme.textColor3);
            },
            itemCount: movies?.length ?? 0,
            itemBuilder: (_, i) => _MovieItem(movies![i]),
          ),
        );
      },
    );
  }

}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        width: 50,
        placeholder: const AssetImage('assets/images/no-image.jpg'),
        image: NetworkImage(movie.fullPosterImg),
        // placeholderFit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(
        movie.originalTitle,
        style: const TextStyle(color: AppTheme.textColor3),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}