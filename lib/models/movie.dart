import 'dart:convert';

class Movie {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  String get fullPosterImg {
    return (posterPath == null)
      ? 'https://i.stack.imgur.com/GNhxO.png'
      : 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String get fullBackdropPath {
    return (posterPath == null)
      ? 'https://i.stack.imgur.com/GNhxO.png'
      : 'https://image.tmdb.org/t/p/w500$backdropPath';
  }

  factory Movie.fromJson(String str) {
    return Movie.fromMap(json.decode(str));
  }

  factory Movie.fromMap(Map<String, dynamic> json) {
    return Movie(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: List<int>.from(json["genre_ids"].map((ids) => ids)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"].toDouble(),
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
    );
  }
}
