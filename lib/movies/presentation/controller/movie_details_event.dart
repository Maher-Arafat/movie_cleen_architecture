part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieDetailsEvent(this.id);
  @override
  List<Object> get props => [id];
}


class GetMovieRecommednationEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieRecommednationEvent(this.id);
  @override
  List<Object> get props => [id];
}
