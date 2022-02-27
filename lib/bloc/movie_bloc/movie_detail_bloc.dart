import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/celebs_model.dart';
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
    try {
      emit(MovieDetailLoading());
      final data = await movieRespository.getMovieById(event.id);
      Movie movie = data[0];
      List<Celebs> celebs = data[1];
      emit(MovieDetailLoadSuccess(
        movie: movie,
        crews: celebs,
      ));
    } catch (e) {
      emit(MovieDetailLoadFailed(message: e.toString()));
    }
  }
}
