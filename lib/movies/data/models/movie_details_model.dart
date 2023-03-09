import 'package:movies/movies/data/models/genres_model.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.id,
    required super.runTime,
    required super.genres,
    required super.backDropPath,
    required super.overView,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        runTime: json['runtime'],
        genres: List<GenresModel>.from(
          json['genres'].map(
            (elmnt) => GenresModel.fromJson(elmnt),
          ),
        ),
        backDropPath: json['backdrop_path'],
        overView: json['overview'],
        releaseDate: json['release_date'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
