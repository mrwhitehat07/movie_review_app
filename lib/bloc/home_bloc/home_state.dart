part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Movie> movies;
  HomeLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class HomeLoadFailed extends HomeState {
  final String message;
  HomeLoadFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
