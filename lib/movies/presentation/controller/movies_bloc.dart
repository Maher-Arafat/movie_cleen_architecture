import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/core/utitlis/enum.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/movies/presentation/controller/movies_events.dart';
import 'package:movies/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MovieEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMovieUseCase,
    this.getTopRatedMovieUseCase,
  ) : super(const MoviesState()) {
    // to add an event
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovie);
    
    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRated);
  }

  FutureOr<void> _getNowPlayingMovie(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMovieUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRated(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMovieUseCase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedState: RequestState.loaded,
          topRatedMovies: r,
        ),
      ),
    );
  }
}
