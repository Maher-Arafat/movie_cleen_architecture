import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/movies/domain/usecases/get_recommndation_usecase.dart';

import '../../../core/utitlis/enum.dart';

import 'movie_details_state.dart';

part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(
    this.getMovieDetailUseCase,
    this.getRecommndationUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommednationEvent>(_getRecommendation);
  }
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommndationUseCase getRecommndationUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailParameters(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessege: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommednationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommndationUseCase(RecommndationParamater(event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessege: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
