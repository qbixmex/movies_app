import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Movies Provider Initialized');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('Getting Displaying Movies ...');
  }
}