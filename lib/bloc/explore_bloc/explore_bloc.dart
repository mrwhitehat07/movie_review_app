import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/celebs_model.dart';
import 'package:movie_review/data/models/genre_model.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/repositories/genre_repository.dart';
import 'package:movie_review/data/repositories/search_repository.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  GenreRepository genreRepository = GenreRepository();
  SearchRepository searchRepository = SearchRepository();

  ExploreBloc() : super(ExploreInitial()) {
    on<ExploreEvent>((event, emit) {});
    on<GetGenre>((event, emit) => getGenres(event, emit));
    on<Search>((event, emit) => searches(event, emit));
  }

  Future<void> getGenres(GetGenre event, Emitter<ExploreState> emit) async {
    try {
      emit(ExploreLoading());
      List<Genre> genres = await genreRepository.getGenreList();
      emit(ExploreLoaded(genre: genres));
    } catch (e) {
      emit(ExploreFailed(message: e.toString()));
    }
  }

  Future<void> searches(Search event, Emitter<ExploreState> emit) async {
    try {
      emit(ExploreLoading());
      List result = await searchRepository.searchMovie(event.query);
      emit(SearchList(movie: result[0], celebs: result[1]));
    } catch (e) {
      emit(ExploreFailed(message: e.toString()));
    }
  }
}
