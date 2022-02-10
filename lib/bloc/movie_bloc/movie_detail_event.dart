part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {}

class LoadMovieDetail extends MovieDetailEvent {
  final int id;
  LoadMovieDetail({
    required this.id
  });
}
