import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movies.dart';

class GetPopularMovieUseCase extends BaseUseCase<List<Movie>,NoParameter>{
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMovieUseCase(this.baseMoviesRepo);
@override
  Future<Either<Failure,List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
