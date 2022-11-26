import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies.provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mexflix'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[

          const SizedBox(height: 20),

          Text(
            'Displaying',
            style: Theme.of(context).textTheme.headline2,
          ),

          //* Main Cards
          CardSwiper(movies: moviesProvider.onDisplayMovies),

          

          //* Movies Slider
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Popular Movies',
            onNextPage: () => moviesProvider.getPopularMovies(),
          ),

        ],
      ) 
      ),
    );
  }
}
