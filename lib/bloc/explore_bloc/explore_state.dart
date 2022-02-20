part of 'explore_bloc.dart';

@immutable
abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final Genre genre;
  ExploreLoaded({
    required this.genre,
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
