import 'package:movies/movies/domain/entities/movies.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.generIds,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        generIds: List.from(json['genre_ids'].map((e) => e)),
        overView: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );
}
