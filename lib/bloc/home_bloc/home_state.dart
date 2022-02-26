part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Movie> movies;
  final List<Movie> actionMovies;
  final List<Celebs> celebs;
  HomeLoaded({
    required this.movies,
    required this.actionMovies,
    required this.celebs,
  });

  @override
  List<Object?> get props => [movies];
}

class HomeLoadFailed extends HomeState {
  final String message;
  HomeLoadFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
