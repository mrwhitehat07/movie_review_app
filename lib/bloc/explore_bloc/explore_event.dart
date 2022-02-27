part of 'explore_bloc.dart';

@immutable
abstract class ExploreEvent {}

class GetGenre extends ExploreEvent {}

class Search extends ExploreEvent {
  final String query;
  Search({
    required this.query,
  });
}

class GetMovieByGenre extends ExploreEvent {
  final int id;
  GetMovieByGenre({
    required this.id,
  });
}
