import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies.provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[

          //* Main Cards
          CardSwiper(movies: moviesProvider.onDisplayMovies),

          //* Movies Slider
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Popular Movies',
          ),

        ],
      ) 
      ),
    );
  }
}
