part of 'explore_bloc.dart';

@immutable
abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Genre> genre;
  final List data;
  ExploreLoaded({
    required this.genre,
    required this.data,
  });

  @override
  List<Object?> get props => [genre];
}

class ExploreFailed extends ExploreState {
  final String message;
  ExploreFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class SearchList extends ExploreState {
  final List<Celebs> celebs;
  final List<Movie> movie;
  SearchList({
    required this.celebs,
    required this.movie,
  });

  @override
  List<Object?> get props => [movie, celebs];
}

class GenreMovieList extends ExploreState {
  final List<Movie> movie;
  GenreMovieList({
    required this.movie,
  });

  @override
  List<Object?> get props => [movie];
}
