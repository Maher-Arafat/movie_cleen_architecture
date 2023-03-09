import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movies.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameter> {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepo);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesRepo.getNowPlayingMovies();
  }
}
