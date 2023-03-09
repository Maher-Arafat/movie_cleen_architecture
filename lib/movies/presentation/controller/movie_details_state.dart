// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../../core/utitlis/enum.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/entities/recommendations.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessege;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessege;
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessege = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessege = '',
  });
  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessege,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessege,
  }) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessege: movieDetailsMessege ?? this.movieDetailsMessege,
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessege:
            recommendationMessege ?? this.recommendationMessege);
  }



  @override
  List<Object?> get props {
    return [
      movieDetail,
      movieDetailsState,
      movieDetailsMessege,
      recommendation,
      recommendationState,
      recommendationMessege,
    ];
  }
}
