import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/entities/movies.dart';
import 'package:movies/movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/movies/domain/usecases/get_recommndation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/recommendations.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetail(
      MovieDetailParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommndation(
    RecommndationParamater paramater
  );
}
