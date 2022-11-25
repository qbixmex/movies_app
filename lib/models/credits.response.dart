import 'dart:convert';
import 'package:movies_app/models/models.dart';

class CreditsResponse {
  final int id;
  final List<Cast> cast;
  final List<Cast> crew;

  CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CreditsResponse.fromJson(String str) {
    return CreditsResponse.fromMap(json.decode(str));
  }

  factory CreditsResponse.fromMap(Map<String, dynamic> json) {
    return CreditsResponse(
      id: json['id'],
      cast: List<Cast>.from(json['cast'].map((x) => Cast.fromMap(x))),
      crew: List<Cast>.from(json['crew'].map((x) => Cast.fromMap(x))),
  );
  }
}

