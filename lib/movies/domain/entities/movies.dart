import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> generIds;
  final String overView;
  final double voteAverage;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.generIds,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate,
  });
  
  
  

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      generIds,
      overView,
      voteAverage,
      releaseDate,
    ];
  }
}
