import 'package:dio/dio.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movies/data/models/movies_model.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/entities/recommendations.dart';
import 'package:movies/movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/movies/domain/usecases/get_recommndation_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../models/movie_details_model.dart';
import '../models/recommndation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetail(MovieDetailParameters parameters);

  Future<List<RecommendationModel>> getRecommndation(
      RecommndationParamater parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((elmnt) => MovieModel.fromJson(elmnt)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(ApiConstants.getPopularPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((elmnt) => MovieModel.fromJson(elmnt)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((elmnt) => MovieModel.fromJson(elmnt)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetail(
      MovieDetailParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.movieDetailPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommndation(
      RecommndationParamater parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((elmnt) => RecommendationModel.fromJson(elmnt)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
