part of 'celebs_detail_bloc.dart';

@immutable
abstract class CelebsDetailState {}

class CelebsDetailInitial extends CelebsDetailState {}

class CelebsDetailLoading extends CelebsDetailState {}

class CelebsDetailLoadSuccess extends CelebsDetailState {
  final Celebs celebs;
  final List<Movie> movies;
  CelebsDetailLoadSuccess({required this.celebs, required this.movies,});

  @override
  List<Object?> get props => [celebs];
}

class CelebsDetailLoadFailed extends CelebsDetailState {
  final String message;
  CelebsDetailLoadFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
