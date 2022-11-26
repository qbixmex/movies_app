import 'dart:convert';
import 'models.dart';

class SearchResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  SearchResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchResponse.fromJson(String str) {
    return SearchResponse.fromMap(json.decode(str));
  }

  factory SearchResponse.fromMap(Map<String, dynamic> json) {
    return SearchResponse(
      page: json['page'],
      results: List<Movie>.from(
        json['results'].map((movie) => Movie.fromMap(movie)),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
