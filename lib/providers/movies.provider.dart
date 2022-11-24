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

  int _popularPage = 0;

  MoviesProvider({ this.page = 1 }) {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {

    final url = Uri.https(
      _baseURL,
      endpoint,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': page.toString(),
      }
    );

    final response = await http.get(url);

    return response.body;

  }

  Future<void> getOnDisplayMovies() async {    

    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    //* This notify and re-draw all necessary widgets.
    notifyListeners();

  }

  Future<void> getPopularMovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('/3/movie/now_playing', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [
      ...popularMovies,
      ...popularResponse.results,
    ];

    //* This notify and re-draw all necessary widgets.
    notifyListeners();

  }
}