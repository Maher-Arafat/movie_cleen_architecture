import 'package:movies/core/network/endpoints.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String apiKy = 'f552ae6049f381bc78dd65366d1c868f';
  static const String nowPlayingPath =
      '$baseUrl/${EndPoint.nowPlaying}?api_key=$apiKy';

  static const String getPopularPath =
      '$baseUrl/${EndPoint.getPopular}?api_key=$apiKy';

  static const String topRatedPath =
      '$baseUrl/${EndPoint.topRated}?api_key=$apiKy';

  static String movieDetailPath(movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKy';

  static String recommendationPath(movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKy';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
