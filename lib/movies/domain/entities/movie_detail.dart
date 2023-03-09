// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/geners.dart';

class MovieDetail extends Equatable {
  final int id;
  final int runTime;
  final List<Genres> genres;
  final String backDropPath;
  final String overView;
  final String releaseDate;
  final String title;
  final double voteAverage;
  const MovieDetail({
    required this.id,
    required this.runTime,
    required this.genres,
    required this.backDropPath,
    required this.overView,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props {
    return [
      id,
      runTime,
      genres,
      backDropPath,
      overView,
      releaseDate,
      title,
      voteAverage,
    ];
  }
}
