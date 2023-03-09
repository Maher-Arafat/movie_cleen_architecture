// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';

import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/recommendations.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';

class GetRecommndationUseCase
    extends BaseUseCase<List<Recommendation>, RecommndationParamater> {
  final BaseMoviesRepo baseMoviesRepo;

  GetRecommndationUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommndationParamater parameter) async {
    return await baseMoviesRepo.getRecommndation(parameter);
  }
}

class RecommndationParamater extends Equatable {
  final int id;

  const RecommndationParamater(this.id);

  @override
  List<Object> get props => [id];
}
