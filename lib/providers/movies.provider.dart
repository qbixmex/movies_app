import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '7bb964a9d8c92a041b572daf2bd481d4';
  final String _baseURL = 'api.themoviedb.org';
  final String _language = 'en-US';
  final int page;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider({ this.page = 1 }) {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<void> getOnDisplayMovies() async {

    final url = Uri.https(
      _baseURL,
      '/3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': page.toString(),
      }
    );
    final response = await http.get(url);

    if (response.statusCode != 200) {
      return print('Error: Service unavailable!');
    }

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    //* This notify and re-draw all necessary widgets.
    notifyListeners();

  }

  Future<void> getPopularMovies() async {

    final url = Uri.https(
      _baseURL,
      '/3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': page.toString(),
      }
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return print('Error: Service unavailable!');
    }

    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [
      ...popularMovies,
      ...popularResponse.results,
    ];

    //* This notify and re-draw all necessary widgets.
    notifyListeners();

  }
}