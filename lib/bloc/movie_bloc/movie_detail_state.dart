part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoadSuccess extends MovieDetailState {
  final Movie movie;
  final List<Celebs> crews;
  final List review;
  MovieDetailLoadSuccess({
    required this.movie,
    required this.crews,
  required this.review,
  });

  @override
  List<Object?> get props => [movie];
}

class MovieDetailLoadFailed extends MovieDetailState {
  final String message;
  MovieDetailLoadFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class MovieReviewing extends MovieDetailState {}

class MovieReviewSuccess extends MovieDetailState {
   final String message;
  MovieReviewSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class MovieReviewFailed extends MovieDetailState {
   final String message;
  MovieReviewFailed({required this.message});

  @override
  List<Object?> get props => [message];
}