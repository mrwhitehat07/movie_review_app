part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoadSuccess extends MovieDetailState {
  final Movie movie;
  MovieDetailLoadSuccess({required this.movie});

  @override
  List<Object?> get props => [movie];
}

class MovieDetailLoadFailed extends MovieDetailState {
  final String message;
  MovieDetailLoadFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
