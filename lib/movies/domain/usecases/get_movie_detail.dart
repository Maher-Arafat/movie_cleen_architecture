// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameters parameter) async {
    return await baseMoviesRepo.getMovieDetail(parameter);
  }
}

class MovieDetailParameters extends Equatable {
  //to pass more than one parameter

  final int movieId;

  const MovieDetailParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
