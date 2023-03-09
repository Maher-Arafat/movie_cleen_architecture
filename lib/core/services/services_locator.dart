import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies/movies/data/repositories/movie_repo.dart';
import 'package:movies/movies/domain/repositories/base_movie_repo.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies/movies/domain/usecases/get_recommndation_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecases/get_movie_detail.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));

    sl.registerFactory(() =>  MovieDetailsBloc(sl(), sl()));

    // UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()));

    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl()));

    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));

    sl.registerLazySingleton(() => GetRecommndationUseCase(sl()));
    
    //Repositry
    sl.registerLazySingleton<BaseMoviesRepo>(() => MovieRepo(sl()));

    //Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
