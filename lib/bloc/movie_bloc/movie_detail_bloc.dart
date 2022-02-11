import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/movie_model.dart';
import 'package:movie_review/data/repositories/movie_repository.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieRespository movieRespository = MovieRespository();
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) {});
    on<LoadMovieDetail>((event, emit) => getMovieDetails(event, emit));
  }

  Future<void> getMovieDetails(
      LoadMovieDetail event, Emitter<MovieDetailState> emit) async {
    // try {
      emit(MovieDetailLoading());
      Movie movie = await movieRespository.getMovieById(event.id);
      print(movie);
      emit(MovieDetailLoadSuccess(movie: movie));
    // } catch (e) {
    //   emit(MovieDetailLoadFailed(message: e.toString()));
    // }
  }
}
